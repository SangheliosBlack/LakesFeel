import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsumoWidget extends StatelessWidget {
  const ConsumoWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Container(
                padding: const EdgeInsets.all(5),
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
                              image: AssetImage(index == 2 || index == 1
                                  ? 'assets/images/burguesa.jpg'
                                  : 'assets/images/fondo.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                      child: index == 2 || index == 1
                          ? Container()
                          : const Icon(
                              FontAwesomeIcons.martiniGlass,
                              color: Colors.white,
                            ),
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
                  index == 2 || index == 1 ? 'La Burguesa' : 'Barra #1',
                  style: GoogleFonts.quicksand(color: Colors.white),
                ),
                Text(
                  'Nombre del producto',
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '\$ - 25.00',
              style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '17/08/20233 10:25',
              style: GoogleFonts.quicksand(color: Colors.white, fontSize: 11),
            ),
          ],
        )
      ],
    );
  }
}
