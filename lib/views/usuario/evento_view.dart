import 'dart:ui';

import 'package:cashless/widgets/participante.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventoView extends StatelessWidget {
  const EventoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                const Image(image: AssetImage('assets/images/fondo2.jpg')),
                Container(
                  height: 275,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    stops: const [.4, 1],
                    colors: [Colors.transparent, Colors.black.withOpacity(1)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
                Positioned(
                  left: 25,
                  top: 50,
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(.2)),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 25,
                  top: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white.withOpacity(.2)),
                        child: const Center(
                          child: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'La Bartola Cantina Bar',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Nombre del evento',
                                style:
                                    GoogleFonts.quicksand(color: Colors.grey),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              '\$ 80.00',
                              style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '25',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Marzo',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sabado',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '10:00 PM - END',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    color: Colors.white.withOpacity(.4))),
                            child: const Icon(
                              Icons.event_available,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: '',
                                style:
                                    GoogleFonts.quicksand(color: Colors.white),
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: 'Acerca del evento',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          ' Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar.',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Participantes',
                            style: GoogleFonts.quicksand(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 20),
            //   height: 130,
            //   child: ListView.separated(
            //       padding: const EdgeInsets.symmetric(horizontal: 25),
            //       physics: const BouncingScrollPhysics(),
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, index) => Participante(index: index),
            //       separatorBuilder: (_, __) => Container(
            //             width: 15,
            //           ),
            //       itemCount: 13),
            // )
          ],
        ),
      ),
    );
  }
}
