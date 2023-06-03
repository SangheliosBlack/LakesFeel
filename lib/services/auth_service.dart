import 'dart:async';
import 'dart:convert';

import 'package:cashless/global/enviroment.dart';
import 'package:cashless/models/admin.dart';
import 'package:cashless/models/auth.dart';
import 'package:cashless/models/calcular_acumulado.dart';
import 'package:cashless/models/cesta.dart';
import 'package:cashless/models/direccion.dart';
import 'package:cashless/models/envio_valor.dart';
import 'package:cashless/models/error.dart';
import 'package:cashless/models/estado_sistema.dart';
import 'package:cashless/models/lista_opciones.dart';
import 'package:cashless/models/producto.dart';
import 'package:cashless/models/usuario.dart';
import 'package:cashless/models/usuario_cantidad.dart';
import 'package:cashless/models/venta_response.dart';
import 'package:cashless/services/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

enum AuthStatus { checking, authenticated, notAuthenticated }

enum TipoUsuario { cliente, vendedor, recarga, admin }

enum ButtonStatus { autenticando, disponible, pressed }

enum BotonesEnvios { send, sleep }

//

//

enum HideMoney { open, close }

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
  HideMoney hideMoney = HideMoney.open;
  ButtonStatus buttonStatus = ButtonStatus.disponible;
  AuthStatus authStatus = AuthStatus.checking;
  TipoUsuario tipoUsuario = TipoUsuario.cliente;
  EstadoSistema estadoSistemaStatus = EstadoSistema.isOpen;

  BotonesEnvios botonesEnvio = BotonesEnvios.sleep;

  List<ListadoOpcionesTemp> listadoTemp = [];

  late Usuario usuario;

  int acumulado = 0;

  String tiendaActiva = '';

  List<double> listaSpark = [0];

  DateTime lastUpdate = DateTime.now();

  List<Venta> listadoAcumulado = [];

  int seleccion = 200;

  late AdminsSource admin;

  modificarCantidadRecarga({required int cantidad}) {
    seleccion = cantidad;
    botonesEnvio = BotonesEnvios.sleep;
    notifyListeners();
  }

  ocultarDineroEstado() {
    if (hideMoney == HideMoney.close) {
      hideMoney = HideMoney.open;
    } else {
      hideMoney = HideMoney.close;
    }
    notifyListeners();
  }

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
        admin = AdminsSource(ventas: 0, recargas: 0, pulseras: 0, usuarios: 0);
        acumulado = 0;
        listadoAcumulado = [];
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
        acumulado = 0;
        listadoAcumulado = [];
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

  Future<UsuarioCantidad?> obtenerUsuarioQr({required String id}) async {
    final data = {"_id": id};

    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/lakesFeel/obtenerPerfilQr'),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {

        final usuarioResponse = usuarioCantidadFromJson(resp.body);
        if (usuarioResponse.usuario.pulsera.isEmpty) {
          if (usuarioResponse.usuario.recargas.isEmpty) {
            seleccion = 500;
            notifyListeners();
          }
        }
        return usuarioResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Venta>> obtenerGastos() async {
    final data = {'usuario': usuario.uid};
    await Future.delayed(const Duration(seconds: 2));

    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/usuario/calcularAcumulado'),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        final response = calcularAcumuladoFromJson(resp.body);
        listaSpark = [0.0];
        listadoAcumulado = [];
        listadoAcumulado = response.ventas;
        acumulado = response.acumulado;
        lastUpdate = response.last;
        for (var i = 0; i < response.ventas.length; i++) {
          if (response.ventas[i].plus) {
            listaSpark.add(double.parse((response.ventas[i].total).toString()));
          }
        }
        notifyListeners();
        return response.ventas;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future adminData() async {
    final data = {'usuario': usuario.uid};
    await Future.delayed(const Duration(seconds: 2));
    final resp = await http.post(Uri.parse('${Statics.apiUrl}/lakesFeel/admin'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    admin = AdminsSource(ventas: 0, recargas: 0, pulseras: 0, usuarios: 0);

    final response = adminsSourceFromJson(resp.body);

    if (resp.statusCode == 200) {
      admin = response;

      notifyListeners();
    }
  }

  Future<bool> sincronizarPulsera({required String numero}) async {
    try {
      final data = {
        'usuario': usuario.uid,
        'numero': numero,
      };

      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/lakesFeel/sincronizarPulsera'),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (resp.statusCode == 200) {
        usuario.pulsera = "dafasfafasfafasf";
        notifyListeners();

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> agregarAbonoCliente({required String id}) async {
    botonesEnvio = BotonesEnvios.send;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 1000));

    try {
      final data = {
        'usuario': id,
        'cantidad': seleccion,
      };

      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/lakesFeel/agregarAbonoCliente'),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      modificarCantidadRecarga(cantidad: 200);

      if (resp.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      botonesEnvio = BotonesEnvios.sleep;
      notifyListeners();
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
          'x-version': '1.0.8 beta'
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

  Future<bool> agregarProductoCesta(
      {bool skuOnly = false,
      required Producto producto,
      required num cantidad,
      required List<String> listado,
      required num envio}) async {
    List<Opcion> opciones = producto.opciones
        .map((e) => Opcion(
            titulo: e.titulo,
            listado: e.listado.map((e) {
              return Listado(
                  precio: e.precio,
                  tipo: e.tipo,
                  activo: listado.contains(e.tipo) ? true : false,
                  auto: e.auto,
                  fijo: e.fijo,
                  hot: e.hot);
            }).toList(),
            maximo: e.maximo,
            minimo: e.minimo))
        .toList();

    var enCesta = productoAgregado(id: producto.id, opciones: opciones);

    if (enCesta!.isNotEmpty) {
      tiendaActiva = tiendaActiva;
      calcularTotal();
      vaciarElementosTemp();
      notifyListeners();

      return true;
    } else {
      final Producto newProducto = Producto(
          id: producto.id,
          precio: producto.precio,
          nombre: producto.nombre,
          descripcion: producto.descripcion,
          descuentoP: producto.descuentoP,
          descuentoC: producto.descuentoC,
          disponible: producto.disponible,
          tienda: producto.tienda,
          cantidad: cantidad,
          extra: calcularOpcionesExtra(opciones: opciones),
          opciones: opciones,
          sku: skuOnly ? producto.sku : producto.id + listado.toString(),
          imagen: producto.imagen,
          hot: producto.hot,
          sugerencia: false,
          fechaVenta: DateTime(0000, 00, 00, 00, 00),
          apartado: false);

      newProducto.cantidad = cantidad;
      usuario.cesta.productos.insert(0, newProducto);

      tiendaActiva = producto.tienda;
      calcularTotal();
      vaciarElementosTemp();
      return true;
    }
  }

  num calcularOpcionesExtra({required List<Opcion> opciones}) {
    if (opciones.isEmpty) {
      return 0;
    } else {
      List<int> errorValores = [];
      List<List<String>> listado = [];
      for (var element in listadoTemp) {
        listado.add(element.listado);
      }

      for (var i = 0; i < listado.length; i++) {
        if (listado[i].length >= opciones[i].minimo) {
          errorValores.add(i);
        } else {
          errorValores.removeWhere((element) => element == i);
        }
      }

      var listaExpanded = listado.expand((x) => x).toList();

      var listaMap = opciones.map((e) => e.listado
          .map((e2) => listaExpanded.contains(e2.tipo) ? e2.precio : 0));

      var listadoMapExpanded = listaMap.expand((x) => x).toList();

      for (var element in errorValores) {
        listadoMapExpanded.add(
            (opciones[element].minimo) * -opciones[element].listado[0].precio);
      }

      var listadpMapReduce =
          listadoMapExpanded.reduce((value, element) => value + element);

      return listadpMapReduce;
    }
  }

  vaciarElementosTemp() {
    listadoTemp = [];
    notifyListeners();
  }

  num calcularTotal() {
    var valores = usuario.cesta.productos.fold<num>(
        0,
        (previousValue, element) =>
            (element.cantidad * (element.precio + element.extra)) +
            previousValue);
    return valores == 0 ? 0 : valores;
  }

  String? productoAgregado(
      {required String id, required List<Opcion> opciones}) {
    List<Producto> listaRepetidos =
        usuario.cesta.productos.where((element) => element.id == id).toList();
    if (listaRepetidos.isEmpty) {
      return '';
    } else {
      for (var item in listaRepetidos) {
        if (listEquals(item.opciones, opciones)) {
          return item.sku;
        }
      }
      return '';
    }
  }

  num totalPiezas() {
    var totaltem = usuario.cesta.productos.fold<num>(
        0, (previousValue, element) => element.cantidad + previousValue);
    return totaltem;
  }

  Future<bool> actulizarCantidad(
      {required int cantidad, required int index}) async {
    usuario.cesta.productos[index].cantidad = cantidad;

    notifyListeners();

    return true;
  }

  Future<bool> eliminarProductoCesta({required int pos}) async {
    usuario.cesta.productos.removeAt(pos);
    if (usuario.cesta.productos.isEmpty) {
      tiendaActiva = "";
    }
    notifyListeners();
    return true;
  }

  Future<bool> eliminarCesta() async {
    usuario.cesta.productos = [];
    tiendaActiva = "";
    notifyListeners();
    return true;
  }

  Future<Venta?> crearPedido(
      {required bool tiendaRopa,
      required List<EnvioValor> listadoEnviosValores,
      bool apartado = false,
      bool liquidado = false,
      String abono = '0',
      required num envio,
      required Direccion direccion,
      String tarjeta = '',
      required String customer}) async {
    botonesEnvio = BotonesEnvios.send;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 1000));
    Cesta cestaEnvio = Cesta(
        productos: usuario.cesta.productos,
        total: calcularTotal(),
        tarjeta: tarjeta,
        direccion: direccion,
        efectivo: usuario.cesta.efectivo,
        codigo: usuario.cesta.codigo,
        apartado: usuario.cesta.apartado);
    String precio = abono.replaceAll('\$', '');
    precio = precio.replaceAll(' ', '');
    precio = precio.replaceAll(',', '');
    precio = precio.replaceAll(',', '');
    final data = {
      'abonoReq': precio,
      'servicio': 0,
      'envio': 0,
      'usuario': usuario.uid,
      'customer': customer,
      'cesta': cestaToJson(cestaEnvio),
      'tienda_ropa': tiendaRopa,
      'apartado': apartado,
      'liquidado': liquidado,
      'envioValores': jsonEncode(listadoEnviosValores)
    };

    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/tiendas/crearPedido'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
            'x-token': await AuthService.getToken(),
            'x-version': '1.0.6 beta'
          });

      var respJson = ventoFromJson(resp.body);

      if (resp.statusCode == 200) {
        usuario.cesta.productos = [];
        usuario.cesta.codigo = '';
        tiendaActiva = '';
        botonesEnvio = BotonesEnvios.sleep;
        notifyListeners();
        return respJson;
      } else {
        botonesEnvio = BotonesEnvios.sleep;
        notifyListeners();
        return null;
      }
    } catch (e) {
      botonesEnvio = BotonesEnvios.sleep;
      notifyListeners();
      return null;
    }
  }

  calcularTiendas() {
    List<String> listado = [];
    for (var element in usuario.cesta.productos) {
      if (listado.contains(element.tienda)) {
      } else {
        listado.add(element.tienda);
      }
    }
    return listado.length;
  }
}
