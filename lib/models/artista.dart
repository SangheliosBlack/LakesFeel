import 'dart:convert';

Artista participanteFromJson(String str) => Artista.fromJson(json.decode(str));

String participanteToJson(Artista data) => json.encode(data.toJson());

class Artista {
  Artista({
    required this.nombre,
    required this.instagram,
    required this.spotify,
    required this.instagramUserName,
    required this.imgUrl,
  });

  String nombre;
  String instagram;
  String instagramUserName;
  String spotify;
  String imgUrl;

  factory Artista.fromJson(Map<String, dynamic> json) => Artista(
        nombre: json["nombre"],
        instagram: json["instagram"],
        spotify: json["spotify"],
        imgUrl: json["imgUrl"],
        instagramUserName: json['instagramUserName'],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "instagram": instagram,
        "instagramUserName": instagramUserName,
        "spotify": spotify,
        "imgUrl": imgUrl,
      };
}
