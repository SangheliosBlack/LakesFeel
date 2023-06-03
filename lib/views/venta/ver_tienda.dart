import 'package:cashless/models/tienda.dart';
import 'package:cashless/widgets/producto.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerTienda extends StatelessWidget {
  const VerTienda({super.key, required this.tienda});

  final Tienda tienda;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      tienda.nombre,
                      style: GoogleFonts.quicksand(
                          color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                const Divider(
                  color: Color.fromRGBO(244, 27, 91, 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                shrinkWrap: true,
                mainAxisSpacing: 8.0,
                children: List.generate(tienda.listaProductos.length, (index) {
                  final producto = tienda.listaProductos[index];
                  return ProductoWidget(
                    producto: producto,
                  );
                })),
          ),
        ],
      ),
    );
  }
}
