import 'package:cashless/models/producto.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductoWidget2 extends StatelessWidget {
  final Producto producto;
  final int index;

  const ProductoWidget2(
      {super.key, required this.producto, required this.index});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                authProvider.eliminarProductoCesta(pos: index);
              },
              child: const Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  producto.nombre,
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '\$ ${producto.precio.toStringAsFixed(2)}',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: producto.cantidad == 1 ? .2 : 1,
              child: GestureDetector(
                onTap: producto.cantidad == 1
                    ? null
                    : () {
                        authProvider.actulizarCantidad(
                            cantidad:
                                int.parse((producto.cantidad - 1).toString()),
                            index: index);
                      },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 27, 91, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                producto.cantidad.toString(),
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18),
              ),
            ),
            GestureDetector(
              onTap: () {
                authProvider.actulizarCantidad(
                    cantidad: int.parse((producto.cantidad + 1).toString()),
                    index: index);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(244, 27, 91, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
