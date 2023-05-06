import 'package:cashless/models/venta_response.dart';
import 'package:cashless/views/usuario/compra_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ConsumoWidget extends StatelessWidget {
  const ConsumoWidget({super.key, required this.venta});

  final Venta venta;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: venta.plus
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PedidoView(venta: venta)),
              );
            }
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: venta.plus
                              ? const Color.fromRGBO(244, 27, 91, 1)
                              : const Color.fromRGBO(250, 180, 4, 1)),
                      child: venta.plus
                          ? const Icon(
                              Icons.trending_down,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.trending_up,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    venta.plus ? 'Venta General' : 'Recarga usuario',
                    style: GoogleFonts.quicksand(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    venta.plus ? '- ' : '+ ',
                    style: GoogleFonts.quicksand(
                        color: venta.plus
                            ? const Color.fromRGBO(244, 27, 91, 1)
                            : const Color.fromRGBO(250, 180, 4, 1),
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    venta.total.toStringAsFixed(2),
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                DateFormat.yMMMEd('es-MX')
                    .add_jm()
                    .format(venta.createdAt.toLocal()),
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 11),
              ),
            ],
          )
        ],
      ),
    );
  }
}
