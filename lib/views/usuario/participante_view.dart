import 'package:cashless/models/artista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ParticipanteView extends StatefulWidget {
  const ParticipanteView({super.key, required this.artista});

  final Artista artista;

  @override
  State<ParticipanteView> createState() => _ParticipanteViewState();
}

class _ParticipanteViewState extends State<ParticipanteView> {
  FlutterInsta flutterInsta = FlutterInsta();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
        body: Stack(
          children: [
            Positioned(
                top: 40,
                left: -width + 30,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: height * 2,
                  height: height * 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10000),
                      border: Border.all(
                          width: 1,
                          color:
                              const Color.fromRGBO(244, 27, 91, 0.0625 * 1))),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: width * 2,
                    height: height * 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10000),
                        border: Border.all(
                            width: 2,
                            color:
                                const Color.fromRGBO(244, 27, 91, 0.0625 * 2))),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: width * 2,
                      height: height * 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          border: Border.all(
                              width: 3,
                              color: const Color.fromRGBO(
                                  244, 27, 91, 0.0625 * 3))),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: width * 2,
                        height: height * 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10000),
                            border: Border.all(
                                width: 4,
                                color: const Color.fromRGBO(
                                    244, 27, 91, 0.0625 * 4))),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          width: width * 2,
                          height: height * 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10000),
                              border: Border.all(
                                  width: 5,
                                  color: const Color.fromRGBO(
                                      244, 27, 91, 0.0625 * 5))),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: width * 2,
                            height: height * 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10000),
                                border: Border.all(
                                    width: 6,
                                    color: const Color.fromRGBO(
                                        244, 27, 91, 0.0625 * 6))),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              width: width * 2,
                              height: height * 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10000),
                                  border: Border.all(
                                      width: 7,
                                      color: const Color.fromRGBO(
                                          244, 27, 91, 0.0625 * 7))),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: width * 2,
                                height: height * 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10000),
                                    border: Border.all(
                                        width: 8,
                                        color: const Color.fromRGBO(
                                            244, 27, 91, 0.0625 * 8))),
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  width: width * 2,
                                  height: height * 2,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10000),
                                      border: Border.all(
                                          width: 9,
                                          color: const Color.fromRGBO(
                                              244, 27, 91, 0.0625 * 9))),
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10000),
                                        border: Border.all(
                                            width: 10,
                                            color: const Color.fromRGBO(
                                                244, 27, 91, 0.0625 * 10))),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      width: width * 2,
                                      height: height * 2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10000),
                                          border: Border.all(
                                              width: 10,
                                              color: const Color.fromRGBO(
                                                  244, 27, 91, 0.0625 * 11))),
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        width: width * 2,
                                        height: height * 2,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10000),
                                            border: Border.all(
                                                width: 11,
                                                color: const Color.fromRGBO(
                                                    244, 27, 91, 0.0625 * 12))),
                                        child: Container(
                                          padding: const EdgeInsets.all(15),
                                          width: width * 2,
                                          height: height * 2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10000),
                                              border: Border.all(
                                                  width: 12,
                                                  color: const Color.fromRGBO(
                                                      244,
                                                      27,
                                                      91,
                                                      0.0625 * 13))),
                                          child: Container(
                                            padding: const EdgeInsets.all(15),
                                            width: width * 2,
                                            height: height * 2,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10000),
                                                border: Border.all(
                                                    width: 13,
                                                    color: const Color.fromRGBO(
                                                        244, 27, 91, .875))),
                                            child: Container(
                                              padding: const EdgeInsets.all(15),
                                              width: width * 2,
                                              height: height * 2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10000),
                                                  border: Border.all(
                                                      width: 14,
                                                      color:
                                                          const Color.fromRGBO(
                                                              244,
                                                              27,
                                                              91,
                                                              .93))),
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  width: width * 2,
                                                  height: height * 2,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10000),
                                                      border: Border.all(
                                                          width: 15,
                                                          color: const Color
                                                                  .fromRGBO(244,
                                                              27, 91, 1)))),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: height,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Hero(
                      tag: widget.artista.instagramUserName,
                      child: SizedBox(
                          height: height,
                          width: width,
                          child: widget.artista.imgUrl.isNotEmpty
                              ? Image(
                                  image: AssetImage(
                                    widget.artista.imgUrl,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : Container()),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        spreadRadius: -3,
                                        blurRadius: 5,
                                        color: Color.fromRGBO(0, 0, 0, .2),
                                      ),
                                    ],
                                  ),
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/fondo.jpg'),
                                                fit: BoxFit.cover)),
                                        child: widget.artista.imgUrl.isNotEmpty
                                            ? Image(
                                                image: AssetImage(
                                                  widget.artista.imgUrl,
                                                ),
                                                fit: BoxFit.cover,
                                              )
                                            : const Icon(
                                                Icons.image_not_supported,
                                                color: Colors.white,
                                              )),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                      width: 80,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 5),
                                            decoration: BoxDecoration(
                                                boxShadow: const [
                                                   BoxShadow(
                                                    offset: Offset(0, 0),
                                                    spreadRadius: -3,
                                                    blurRadius: 5,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, .2),
                                                  ),
                                                ],
                                                color: const Color.fromRGBO(
                                                    244, 27, 91, 1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              'DJ',
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 11,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.artista.nombre,
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          '@${widget.artista.instagramUserName}',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchUrl(url: widget.artista.instagram);
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          widget.artista.spotify.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    _launchUrl(url: widget.artista.spotify);
                                  },
                                  behavior: HitTestBehavior.translucent,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 1, color: Colors.white)),
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: const Icon(
                                        FontAwesomeIcons.spotify,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),

            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     padding: const EdgeInsets.all(15),
            //     decoration: BoxDecoration(
            //         boxShadow: [
            //           const BoxShadow(
            //             offset: Offset(5, 5),
            //             spreadRadius: -3,
            //             blurRadius: 5,
            //             color: Color.fromRGBO(0, 0, 0, 1),
            //           ),
            //         ],
            //         borderRadius: BorderRadius.circular(35),
            //         color: Colors.black),
            //     margin:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //     width: width - 20,
            //     child: Container(
            //         width: 50,
            //         height: 50,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(
            //               children: [
            //                 ClipRRect(
            //                   borderRadius: BorderRadius.circular(15),
            //                   child: SizedBox(
            //                       width: 50,
            //                       height: 50,
            //                       child: const Image(
            //                         image: NetworkImage(
            //                           'https://is3-ssl.mzstatic.com/image/thumb/Music112/v4/98/7b/59/987b59f7-4e21-0e63-9d12-3cb010a09ee7/cover.jpg/1200x1200bf-60.jpg',
            //                         ),
            //                         fit: BoxFit.cover,
            //                       )),
            //                 ),
            //                 const SizedBox(
            //                   width: 15,
            //                 ),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text(
            //                       'Morenito',
            //                       style: GoogleFonts.quicksand(
            //                           color: Colors.white),
            //                     ),
            //                     const SizedBox(
            //                       height: 3,
            //                     ),
            //                     Text(
            //                       'Chile',
            //                       style:
            //                           GoogleFonts.quicksand(color: Colors.grey),
            //                     )
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             Row(
            //               children: [
            //                 Icon(
            //                   FontAwesomeIcons.spotify,
            //                   color: Color.fromRGBO(0, 230, 151, 1),
            //                   size: 30,
            //                 ),
            //                 SizedBox(
            //                   width: 15,
            //                 ),
            //                 Icon(
            //                   Icons.play_arrow,
            //                   color: Colors.white,
            //                 ),
            //               ],
            //             )
            //           ],
            //         )),
            //   ),
            // )
          ],
        ));
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  
}
