import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductoWidget2 extends StatelessWidget {
  const ProductoWidget2({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 55,
              width: 55,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                        width: 1, color: const Color.fromRGBO(244, 27, 91, 1))),
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
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nombre',
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
                  '\$ 25.00',
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 27, 91, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '1',
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 27, 91, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
