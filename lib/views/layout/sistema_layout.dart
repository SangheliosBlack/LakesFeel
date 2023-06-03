import 'package:cashless/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metaballs/metaballs.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SistemaEstadoLayout extends StatelessWidget {
  const SistemaEstadoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(244, 27, 91, 1),
        centerTitle: true,
        title: Text(
          authProvider.estadoSistemaStatus == EstadoSistema.restringido
              ? 'Usuario restringido.'
              : authProvider.estadoSistemaStatus == EstadoSistema.noUpdate
                  ? 'Actuliza tu app'
                  : authProvider.estadoSistemaStatus == EstadoSistema.isClosed
                      ? 'Servidor cerrado error 400.'
                      : 'Mantenimiento error 202.',
          style: GoogleFonts.quicksand(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SizedBox(
              width: width,
              height: height,
              child: Metaballs(
                color: const Color.fromRGBO(244, 27, 91, 1),
                effect: MetaballsEffect.follow(
                  growthFactor: 1,
                  smoothing: 1,
                  radius: 0.5,
                ),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(250, 180, 4, 1),
                  Color.fromRGBO(244, 27, 91, 1),
                ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                metaballs: 40,
                animationDuration: const Duration(milliseconds: 200),
                speedMultiplier: 2,
                bounceStiffness: 3,
                minBallRadius: 15,
                maxBallRadius: 60,
                glowRadius: 0.7,
                glowIntensity: 0.5,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.only(top: 35),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: SizedBox(
                      width: width,
                      height: width,
                      child:
                          const Image(image: AssetImage('assets/images/logo.png')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      authProvider.estadoSistemaStatus ==
                              EstadoSistema.restringido
                          ? 'Tu usuario ha sido restringido del sistema'
                          : authProvider.estadoSistemaStatus ==
                                  EstadoSistema.noUpdate
                              ? 'Tu version de Lakes Feel se encuentra desactulizada :('
                              : authProvider.estadoSistemaStatus ==
                                      EstadoSistema.isClosed
                                  ? 'Lakes Feel se encuentra fuera de linea :('
                                  : 'Lakes Feel se encuentra en mantenimiento :(',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                          fontSize: 23, color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(bottom: 35),
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () => SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop'),
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromRGBO(244, 27, 91, 1)),
                          child: Center(
                            child: Text(
                              'Salir',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 18),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
