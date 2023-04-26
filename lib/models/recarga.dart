// To parse this JSON data, do
//
//     final recarga = recargaFromJson(jsonString);

import 'dart:convert';
List<Recarga> recargasFromJson(String str) => List<Recarga>.from(json.decode(str).map((x) => Recarga.fromJson(x)));

Recarga recargaFromJson(String str) => Recarga.fromJson(json.decode(str));

String recargaToJson(Recarga data) => json.encode(data.toJson());

class Recarga {
    Recarga({
        required this.updatedAt,
        required this.createdAt,
        required this.cantidad,
        required this.id,
        required this.usuario,
    });

    DateTime updatedAt;
    DateTime createdAt;
    int cantidad;
    String id;
    String usuario;

    factory Recarga.fromJson(Map<String, dynamic> json) => Recarga(
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        cantidad: json["cantidad"],
        id: json["_id"],
        usuario: json["usuario"],
    );

    Map<String, dynamic> toJson() => {
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "cantidad": cantidad,
        "_id": id,
        "usuario": usuario,
    };
}
