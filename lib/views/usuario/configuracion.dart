import 'package:cashless/services/auth_service.dart';
import 'package:cashless/services/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfiguracionView extends StatelessWidget {
  const ConfiguracionView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context);
    final nombre = authProvider.usuario.nombre.split(' ');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Configuracion',
          style: GoogleFonts.quicksand(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: 'configuracion',
              child: Container(
                width: 140,
                height: 140,
                margin: const EdgeInsets.only(top: 20, bottom: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(244, 27, 91, .1))),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(244, 27, 91, .4))),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(244, 27, 91, 1))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/fondo.jpg'),
                                    fit: BoxFit.cover)),
                            child: const Image(
                                image: AssetImage('assets/images/logo2.png'))),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'NOMBRE',
                              style: GoogleFonts.quicksand(
                                  color: Colors.grey, fontSize: 11),
                            ),
                            Text(
                              authProvider.usuario.nombre,
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'CORREO',
                              style: GoogleFonts.quicksand(
                                  color: Colors.grey, fontSize: 11),
                            ),
                            Text(
                              authProvider.usuario.correo,
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'CELULAR',
                              style: GoogleFonts.quicksand(
                                  color: Colors.grey, fontSize: 11),
                            ),
                            Text(
                              authProvider.usuario.dialCode +
                                  ' ' +
                                  authProvider.usuario.numeroCelular,
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // .
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        navigationService.navigateTo('/');
                        authProvider.logout();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(244, 27, 91, .4)),
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(3, 0),
                                  spreadRadius: -5,
                                  blurRadius: 28,
                                  color: Color.fromRGBO(0, 0, 0, .5),
                                ),
                              ],
                              color: const Color.fromRGBO(244, 27, 91, 1)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Cerrar sesion',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
