import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarOpciones extends StatelessWidget {
  const AvatarOpciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(244, 27, 91, 1), width: 1),
              borderRadius: BorderRadius.circular(1000)),
          child: const Icon(
            Icons.qr_code,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Titulo',
          style: GoogleFonts.quicksand(color: Colors.white),
        ),
      ],
    );
  }
}
