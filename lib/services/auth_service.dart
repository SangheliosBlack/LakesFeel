import 'dart:convert';

import 'package:cashless/global/enviroment.dart';
import 'package:cashless/models/auth.dart';
import 'package:cashless/models/error.dart';
import 'package:cashless/models/estado_sistema.dart';
import 'package:cashless/models/usuario.dart';
import 'package:cashless/services/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum AuthStatus { checking, authenticated, notAuthenticated }

enum TipoUsuario { cliente, vendedor, recarga, admin }

enum ButtonStatus { autenticando, disponible, pressed }

enum EstadoSistema {
  isMaintenance,
  isClosed,
  isOpen,
  isAvailable,
  isNotAvailable,
  noUpdate,
  restringido
}

class AuthService with ChangeNotifier {
  ButtonStatus buttonStatus = ButtonStatus.disponible;
  AuthStatus authStatus = AuthStatus.checking;
  TipoUsuario tipoUsuario = TipoUsuario.cliente;
  EstadoSistema estadoSistemaStatus = EstadoSistema.isOpen;

  late Usuario usuario;

  Future<bool> isLoggedIn() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final token = LocalStorage.prefs.getString('token');
      final resp = await http.get(
          Uri.parse('${Statics.apiUrl}/autentificacion/renovarCodigo'),
          headers: {
            'Content-Type': 'application/json',
            'x-token': token ?? '',
          });
      if (resp.statusCode == 200) {
        final loginResponse = loginResponseFromJson(resp.body);

        usuario = loginResponse.usuario;

        await _guardarToken(loginResponse.token);
        await Future.delayed(const Duration(milliseconds: 750));
        return true;
      } else {
        logout();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future logout() async {
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
    await LocalStorage.prefs.remove('token');
  }

  Future cambiarMetodoDePago({required int tipo}) async {
    if (tipo == 1) {
      usuario.cesta.efectivo = false;
    } else {
      usuario.cesta.efectivo = true;
    }
    notifyListeners();
  }

  Future<bool> logInCelular({required String numero}) async {
    final data = {
      'numero': numero.replaceAll(' ', ''),
    };
    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/autentificacion/iniciarUsuarioTelefono'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
          });
      if (resp.statusCode == 200) {
        final loginResponse = loginResponseFromJson(resp.body);
        usuario = loginResponse.usuario;
        await _guardarToken(loginResponse.token);
        await Future.delayed(const Duration(milliseconds: 750));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Usuario?> obtenerUsuarioQr({required String id}) async {
    final data = {"_id": id};
    await Future.delayed(const Duration(seconds: 1));

    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/lakesFeel/obtenerPerfilQr'),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        final usuarioResponse = usuarioFromJson(resp.body);
        return usuarioResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> agregarAbonoCliente(
      {required String id, required num cantidad}) async {
    try {
      final data = {'id': id, 'cantidad': cantidad, 'usuario': usuario.uid};

      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/lakesFeel/agregarAbonoCliente'),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future register(String nombre, String email, String password, String numero,
      String passwordCheck, String dialCode) async {
    buttonStatus = ButtonStatus.autenticando;
    await Future.delayed(const Duration(milliseconds: 500));
    List<Errore> lista = [];
    final String superNumero = numero.replaceAll(RegExp(r' '), '');
    final data = {
      'nombre': nombre,
      'correo': email,
      'contrasena': password,
      'confirmar_contrasena': passwordCheck,
      'numero_celular': superNumero,
      'dialCode': dialCode,
    };

    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/autentificacion/nuevoUsuario'),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});


      if (resp.statusCode == 200) {
        final loginResponse = loginResponseFromJson(resp.body);
        usuario = loginResponse.usuario;
        await _guardarToken(
          loginResponse.token,
        );
        return lista;
      } else {
        final resErrores = errorResponseFromJson(resp.body);
        lista = resErrores.errores;
        return lista;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<String> getToken() async {
    final token = LocalStorage.prefs.getString('token');
    return token!;
  }

  Future _guardarToken(String token) async {
    await LocalStorage.prefs.setString('token', token);
    authStatus = AuthStatus.authenticated;
    buttonStatus = ButtonStatus.disponible;
    await revisarEstado();
    notifyListeners();
  }

    revisarEstado() async {
    final resp = await http.get(
        Uri.parse('${Statics.apiUrl}/autentificacion/revisarEstado'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken(),
          'x-version': '1.0.6 beta'
        });


    final estado = estadoSistemaFromJson(resp.body);

    if (estado.restringido) {
      estadoSistemaStatus = EstadoSistema.restringido;
    } else {
      if (estado.version != 'true') {
        estadoSistemaStatus = EstadoSistema.noUpdate;
      } else {
        if (estado.cerrada) {
          estadoSistemaStatus = EstadoSistema.isClosed;
        } else if (estado.mantenimiento) {
          estadoSistemaStatus = EstadoSistema.isMaintenance;
        } else if (estado.disponible) {
          estadoSistemaStatus = EstadoSistema.isAvailable;
        } else {
          estadoSistemaStatus = EstadoSistema.isNotAvailable;
        }
      }
    }
  }
}
