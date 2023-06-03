import 'dart:convert';

AdminsSource adminsSourceFromJson(String str) => AdminsSource.fromJson(json.decode(str));

String adminsSourceToJson(AdminsSource data) => json.encode(data.toJson());

class AdminsSource {
    int ventas;
    int recargas;
    int pulseras;
    int usuarios;

    AdminsSource({
        required this.ventas,
        required this.recargas,
        required this.pulseras,
        required this.usuarios,
    });

    factory AdminsSource.fromJson(Map<String, dynamic> json) => AdminsSource(
        ventas: json["ventas"],
        recargas: json["recargas"],
        pulseras: json["pulseras"],
        usuarios: json["usuarios"],
    );

    Map<String, dynamic> toJson() => {
        "ventas": ventas,
        "recargas": recargas,
        "pulseras": pulseras,
        "usuarios": usuarios,
    };
}
