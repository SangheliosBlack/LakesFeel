import 'package:cashless/models/producto.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductoWidget extends StatelessWidget {
  const ProductoWidget({super.key, required this.producto});

  final Producto producto;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context);
    return GestureDetector(
      onTap: () async {
        await authProvider.agregarProductoCesta(
            producto: producto, cantidad: 1, listado: [], envio: 0);

        Navigator.pop(context);
      },
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1, color: const Color.fromRGBO(244, 27, 91, 1))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/fondo.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            producto.nombre,
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '\$ ${producto.precio.toStringAsFixed(2)}',
                            style: GoogleFonts.quicksand(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
