import 'dart:convert';

import 'package:cashless/models/usuario.dart';

UsuarioCantidad usuarioCantidadFromJson(String str) =>
    UsuarioCantidad.fromJson(json.decode(str));

class UsuarioCantidad {
  UsuarioCantidad({required this.usuario, required this.total});

  Usuario usuario;
  num total;

  factory UsuarioCantidad.fromJson(Map<String, dynamic> json) => UsuarioCantidad(
      total: json['total'], usuario: Usuario.fromJson(json["usuario"]), );

}
