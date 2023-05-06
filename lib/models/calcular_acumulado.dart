// To parse this JSON data, do
//
//     final calcularAcumulado = calcularAcumuladoFromJson(jsonString);

import 'dart:convert';

import 'package:cashless/models/venta_response.dart';

CalcularAcumulado calcularAcumuladoFromJson(String str) =>
    CalcularAcumulado.fromJson(json.decode(str));

String calcularAcumuladoToJson(CalcularAcumulado data) =>
    json.encode(data.toJson());

class CalcularAcumulado {
  int acumulado;
  List<Venta> ventas;
  DateTime last;

  CalcularAcumulado({
    required this.acumulado,
    required this.last,
    required this.ventas,
  });

  factory CalcularAcumulado.fromJson(Map<String, dynamic> json) =>
      CalcularAcumulado(
        acumulado: json["acumulado"],
        ventas: List<Venta>.from(json["ventas"].map((x) => Venta.fromJson(x))), last: DateTime.parse(json["last"]),
      );

  Map<String, dynamic> toJson() => {
        "acumulado": acumulado,
        "ventas": List<dynamic>.from(ventas.map((x) => x.toJson())),
      };
}
