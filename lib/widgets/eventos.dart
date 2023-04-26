import 'package:cashless/views/usuario/evento_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventosWidget extends StatelessWidget {
  final int index;
  const EventosWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EventoView()),
        );
      }),
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(244, 27, 91, 1))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: const Color.fromRGBO(38, 25, 35, 1),
                  width: 100,
                  height: 100,
                  child: Image(
                    image: index == 0
                        ? const AssetImage('assets/images/bartola.jpg')
                        : const AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            index == 0 ? '25/03/2023' : '03/05/2023',
            style: GoogleFonts.quicksand(color: Colors.white),
          )
        ],
      ),
    );
  }
}
