import 'dart:convert';

import 'package:cashless/models/producto.dart';
import 'package:cashless/models/promocion.dart';


Tienda tiendaFromJson(String str) => Tienda.fromJson(json.decode(str));

String tiendaToJson(List<Tienda> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tienda {
  Tienda(
      {required this.fotografias,
      required this.inventario,
      required this.equipo,
      required this.ventas,
      required this.nombre,
      required this.propietario,
      required this.disponible,
      required this.productos,
      required this.aniversario,
      required this.direccion,
      required this.createdAt,
      required this.updatedAt,
      required this.uid,
      required this.horario,
      required this.coordenadas,
      required this.tiempoEspera,
      required this.online,
      required this.puntoVenta,
      required this.imagenPerfil,
      required this.autoImpresion,
      required this.mac,
      required this.tiendaRopa,
      required this.sugerencia,
      required this. promociones,
      required this.listaProductos});

  String fotografias;
  List<dynamic> inventario;
  List<dynamic> equipo;
  List<dynamic> ventas;
  String nombre;
  String propietario;
  bool disponible;
  String productos;
  DateTime aniversario;
  DateTime createdAt;
  DateTime updatedAt;
  String uid;
  String direccion;
  Horario horario;
  String puntoVenta;
  bool online;
  num tiempoEspera;
  Coordenadas coordenadas;
  List<Producto> listaProductos;
  String imagenPerfil;
  String mac;
  bool autoImpresion;
  bool sugerencia;
  bool tiendaRopa;
  List<Promocion> promociones;

  factory Tienda.fromJson(Map<String, dynamic> json) => Tienda(
        tiendaRopa: json['tienda_ropa'] ?? false,
        fotografias: json['fotografias'],
        inventario: List<dynamic>.from(json["inventario"].map((x) => x)),
        equipo: List<dynamic>.from(json["equipo"].map((x) => x)),
        ventas: List<dynamic>.from(json["ventas"].map((x) => x)),
        nombre: json["nombre"],
        propietario: json["propietario"],
        disponible: json["disponible"],
        productos: json["productos"],
        aniversario: DateTime.parse(json["aniversario"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        uid: json["uid"] ?? json['_id'],
        horario: Horario.fromJson(json["horario"]),
        coordenadas: Coordenadas.fromJson(json["coordenadas"]),
        promociones: json['promociones'] !=  null? List<Promocion>.from(json['promociones'].map((x)=>Promocion.fromJson(x))) :[],
        listaProductos: json["listaProductos"] != null
            ? List<Producto>.from(
                json["listaProductos"].map((x) => Producto.fromJson(x)))
            : [],
        imagenPerfil: json['imagen_perfil'],
        direccion: json['direccion'],
        online: json['online'],
        puntoVenta: json['punto_venta'] ?? '',
        tiempoEspera: json['tiempo_espera'],
        autoImpresion: json['auto_impresion'],
        mac: json['mac'] ?? '',
        sugerencia: json['sugerencia'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "fotografias": fotografias,
        "inventario": List<dynamic>.from(inventario.map((x) => x)),
        "equipo": List<dynamic>.from(equipo.map((x) => x)),
        "ventas": List<dynamic>.from(ventas.map((x) => x)),
        "nombre": nombre,
        "propietario": propietario,
        "disponible": disponible,
        "productos": productos,
        "aniversario": aniversario.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "uid": uid,
        "tiempoEspera": tiempoEspera,
        "online": online,
        "horario": horario.toJson(),
        "puntoVenta": puntoVenta,
        "coordenadas": coordenadas.toJson(),
        "listaProductos":
            List<Producto>.from(listaProductos.map((x) => x.toJson())),
      };
}

class Coordenadas {
  Coordenadas({
    required this.id,
    required this.latitud,
    required this.longitud,
  });

  String id;
  double latitud;
  double longitud;

  factory Coordenadas.fromJson(Map<String, dynamic> json) => Coordenadas(
        id: json["_id"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "latitud": latitud,
        "longitud": longitud,
      };
}

class Horario {
  Horario({
    required this.apertura,
    required this.cierre,
  });

  DateTime apertura;
  DateTime cierre;

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        apertura: DateTime.parse(json["apertura"]),
        cierre: DateTime.parse(json["cierre"]),
      );

  Map<String, dynamic> toJson() => {
        "apertura": apertura.toIso8601String(),
        "cierre": cierre.toIso8601String(),
      };
}
