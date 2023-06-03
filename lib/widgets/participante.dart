import 'package:cashless/models/artista.dart';
import 'package:cashless/views/usuario/participante_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Participante extends StatelessWidget {
  const Participante({super.key, required this.artista});
  final Artista artista;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ParticipanteView(
                    artista: artista,
                  )),
        );
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color: Colors.white)),
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/fondo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Hero(
                  tag: artista.instagramUserName,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: artista.imgUrl.isNotEmpty
                          ? Image(
                              image: AssetImage(artista.imgUrl),
                              fit: BoxFit.cover,
                            )
                          : const Icon(
                              Icons.image_not_supported,
                              color: Colors.white,
                            )),
                )),
          ),
          Text(
            artista.nombre,
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
