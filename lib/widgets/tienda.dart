import 'package:cashless/models/tienda.dart';
import 'package:cashless/views/venta/ver_tienda.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TiendaWidget extends StatelessWidget {
  final Tienda tienda;
  const TiendaWidget({super.key, required this.tienda});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerTienda(
                    tienda: tienda,
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            child: SizedBox(
              height: 80,
              width: 80,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1, color: const Color.fromRGBO(244, 27, 91, 1))),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(tienda.nombre == 'La Burguesa'
                                  ? 'assets/images/burguesa.jpg'
                                  : 'assets/images/fondo.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                      child: tienda.nombre == 'Lakes Feel'
                          ? const Image(image: AssetImage('assets/images/logo3.png'))
                          : tienda.nombre == 'Gula La'
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Image(
                                      image:
                                          AssetImage('assets/images/gula.png')),
                                )
                              : Container(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 80,
            child: Center(
              child: Text(
                tienda.nombre,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
