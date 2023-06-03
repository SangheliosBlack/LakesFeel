// ignore_for_file: use_build_context_synchronously

import 'package:cashless/global/enviroment.dart';
import 'package:cashless/packages/sparkline.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:cashless/views/administrador/administrador_dashboard.dart';
import 'package:cashless/views/usuario/configuracion.dart';
import 'package:cashless/widgets/consumo.dart';
import 'package:cashless/widgets/participante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardUsuarioView extends StatefulWidget {
  const DashboardUsuarioView({super.key});

  @override
  State<DashboardUsuarioView> createState() => _DashboardUsuarioViewState();
}

class _DashboardUsuarioViewState extends State<DashboardUsuarioView> {
  FlutterInsta flutterInsta = FlutterInsta();

  @override
  void initState() {
    final authProvider = Provider.of<AuthService>(context, listen: false);

    authProvider.obtenerGastos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context);

    final nombre = authProvider.usuario.nombre.split(' ');
    PageController controller =
        PageController(viewportFraction: 1, initialPage: 0);
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(0, 155, 89, 89),
            appBar: AppBar(
              leadingWidth: 120,
              actions: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      elevation: 10,
                      backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
                      context: context,
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: PageView(
                                controller: controller,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Google Play Store',
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white)),
                                          const SizedBox(width: 10),
                                          const Icon(
                                            FontAwesomeIcons.googlePlay,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 30),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  244, 27, 91, 1),
                                              width: 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        244, 27, 91, 1),
                                                    width: 1),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/fondo.jpg'),
                                                    fit: BoxFit.cover)),
                                            child: PrettyQr(
                                              elementColor: Colors.white,
                                              size: 150,
                                              data:
                                                  'https://play.google.com/store/apps/details?id=com.lakes.feel',
                                              errorCorrectLevel:
                                                  QrErrorCorrectLevel.M,
                                              roundEdges: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('WEB APP',
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white)),
                                          const SizedBox(width: 10),
                                          const Icon(
                                            FontAwesomeIcons.globe,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 30),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  244, 27, 91, 1),
                                              width: 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        244, 27, 91, 1),
                                                    width: 1),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/fondo.jpg'),
                                                    fit: BoxFit.cover)),
                                            child: PrettyQr(
                                              elementColor: Colors.white,
                                              data:
                                                  'https://lakes-feel.herokuapp.com/',
                                              errorCorrectLevel:
                                                  QrErrorCorrectLevel.M,
                                              size: 150,
                                              roundEdges: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SmoothPageIndicator(
                              controller: controller,
                              count: 2,
                              effect: ExpandingDotsEffect(
                                dotHeight: 10,
                                dotWidth: 10,
                                activeDotColor: Colors.white,
                                dotColor: Colors.white.withOpacity(.4),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                height: 45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        const Color.fromRGBO(244, 27, 91, 1)),
                                child: Center(
                                  child: Text(
                                    'Cerrar',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 25, left: 25),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
              leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfiguracionView()),
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Text(
                        nombre[0],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.expand_more,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.black,
              centerTitle: true,
              toolbarHeight: 80,
              title: const Hero(
                tag: 'configuracion',
                child: SizedBox(
                    width: 55,
                    height: 55,
                    child: Image(image: AssetImage('assets/images/logo2.png'))),
              ),
            ),
            body: PageView(
              physics: authProvider.usuario.socio
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    await authProvider.obtenerGastos();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            // Container(
                            //   height: 55,
                            //   child: PageView(
                            //     onPageChanged: (c) {
                            //       setState(() {});
                            //     },
                            //     physics: BouncingScrollPhysics(),
                            //     controller: controller,
                            //     scrollDirection: Axis.horizontal,
                            //     children: [
                            //       FutureBuilder(
                            //         future:
                            //             flutterInsta.getProfileData('juliosdfghjk'),
                            //         builder: (BuildContext context,
                            //             AsyncSnapshot<dynamic> snapshot) {
                            //           return Container(
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 25, vertical: 5),
                            //             child: Row(
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     Container(
                            //                       padding: const EdgeInsets.all(5),
                            //                       decoration: BoxDecoration(
                            //                           borderRadius:
                            //                               BorderRadius.circular(100),
                            //                           border: Border.all(
                            //                               width: .5,
                            //                               color: const Color.fromRGBO(
                            //                                   244, 27, 91, 1))),
                            //                       child: ClipRRect(
                            //                         borderRadius:
                            //                             BorderRadius.circular(50),
                            //                         child: Container(
                            //                           width: 34,
                            //                           height: 34,
                            //                           child: Image(
                            //                               image: NetworkImage(
                            //                                   flutterInsta.imgurl)),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     const SizedBox(
                            //                       width: 10,
                            //                     ),
                            //                     Column(
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       children: [
                            //                         Text(
                            //                           flutterInsta.username,
                            //                           style: GoogleFonts.quicksand(
                            //                               color: Colors.white),
                            //                         ),
                            //                         const SizedBox(
                            //                           height: 3,
                            //                         ),
                            //                         Row(
                            //                           children: [
                            //                             Text(
                            //                               flutterInsta.followers
                            //                                   .toString(),
                            //                               style:
                            //                                   GoogleFonts.quicksand(
                            //                                       fontWeight:
                            //                                           FontWeight.w600,
                            //                                       color:
                            //                                           Colors.white),
                            //                             ),
                            //                             const SizedBox(
                            //                               width: 5,
                            //                             ),
                            //                             Text(
                            //                               'Seguidores',
                            //                               style:
                            //                                   GoogleFonts.quicksand(
                            //                                       color:
                            //                                           Colors.white),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ],
                            //                 ),
                            //                 const Spacer(),
                            //                 Container(
                            //                   padding: const EdgeInsets.symmetric(
                            //                       horizontal: 20, vertical: 8),
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(10),
                            //                       color: const Color.fromRGBO(
                            //                           0, 149, 246, 1)),
                            //                   child: Text(
                            //                     'Seguir',
                            //                     style: GoogleFonts.quicksand(
                            //                         color: Colors.white),
                            //                   ),
                            //                 )
                            //               ],
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //       FutureBuilder(
                            //         future: flutterInsta.getProfileData('lakes.feel'),
                            //         builder: (BuildContext context,
                            //             AsyncSnapshot<dynamic> snapshot) {
                            //           return Container(
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 25, vertical: 5),
                            //             child: Row(
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     Container(
                            //                       padding: const EdgeInsets.all(5),
                            //                       decoration: BoxDecoration(
                            //                           borderRadius:
                            //                               BorderRadius.circular(100),
                            //                           border: Border.all(
                            //                               width: .5,
                            //                               color: const Color.fromRGBO(
                            //                                   244, 27, 91, 1))),
                            //                       child: ClipRRect(
                            //                         borderRadius:
                            //                             BorderRadius.circular(50),
                            //                         child: Container(
                            //                           width: 34,
                            //                           height: 34,
                            //                           child: Image(
                            //                               image: NetworkImage(
                            //                                   flutterInsta.imgurl)),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     const SizedBox(
                            //                       width: 10,
                            //                     ),
                            //                     Column(
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       children: [
                            //                         Text(
                            //                           flutterInsta.username,
                            //                           style: GoogleFonts.quicksand(
                            //                               color: Colors.white),
                            //                         ),
                            //                         const SizedBox(
                            //                           height: 3,
                            //                         ),
                            //                         Row(
                            //                           children: [
                            //                             Text(
                            //                               flutterInsta.followers
                            //                                   .toString(),
                            //                               style:
                            //                                   GoogleFonts.quicksand(
                            //                                       fontWeight:
                            //                                           FontWeight.w600,
                            //                                       color:
                            //                                           Colors.white),
                            //                             ),
                            //                             const SizedBox(
                            //                               width: 5,
                            //                             ),
                            //                             Text(
                            //                               'Seguidores',
                            //                               style:
                            //                                   GoogleFonts.quicksand(
                            //                                       color:
                            //                                           Colors.white),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ],
                            //                 ),
                            //                 const Spacer(),
                            //                 Container(
                            //                   padding: const EdgeInsets.symmetric(
                            //                       horizontal: 20, vertical: 8),
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(10),
                            //                       color: const Color.fromRGBO(
                            //                           0, 149, 246, 1)),
                            //                   child: Text(
                            //                     'Seguir',
                            //                     style: GoogleFonts.quicksand(
                            //                         color: Colors.white),
                            //                   ),
                            //                 )
                            //               ],
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //       FutureBuilder(
                            //         future: flutterInsta
                            //             .getProfileData('rock.u.management'),
                            //         builder: (BuildContext context,
                            //             AsyncSnapshot<dynamic> snapshot) {
                            //           return Container(
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 25, vertical: 5),
                            //             child: Row(
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     Container(
                            //                       padding: const EdgeInsets.all(5),
                            //                       decoration: BoxDecoration(
                            //                           borderRadius:
                            //                               BorderRadius.circular(100),
                            //                           border: Border.all(
                            //                               width: .5,
                            //                               color: const Color.fromRGBO(
                            //                                   244, 27, 91, 1))),
                            //                       child: ClipRRect(
                            //                         borderRadius:
                            //                             BorderRadius.circular(50),
                            //                         child: Container(
                            //                           width: 34,
                            //                           height: 34,
                            //                           child: Image(
                            //                               image: NetworkImage(
                            //                                   flutterInsta.imgurl)),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                     const SizedBox(
                            //                       width: 10,
                            //                     ),
                            //                     Column(
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       children: [
                            //                         Text(
                            //                           flutterInsta.username,
                            //                           style: GoogleFonts.quicksand(
                            //                               color: Colors.white),
                            //                         ),
                            //                         const SizedBox(
                            //                           height: 3,
                            //                         ),
                            //                         Row(
                            //                           children: [
                            //                             Text(
                            //                               flutterInsta.followers
                            //                                   .toString(),
                            //                               style:
                            //                                   GoogleFonts.quicksand(
                            //                                       fontWeight:
                            //                                           FontWeight.w600,
                            //                                       color:
                            //                                           Colors.white),
                            //                             ),
                            //                             const SizedBox(
                            //                               width: 5,
                            //                             ),
                            //                             Text(
                            //                               'Seguidores',
                            //                               style:
                            //                                   GoogleFonts.quicksand(
                            //                                       color:
                            //                                           Colors.white),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ],
                            //                 ),
                            //                 const Spacer(),
                            //                 Container(
                            //                   padding: const EdgeInsets.symmetric(
                            //                       horizontal: 20, vertical: 8),
                            //                   decoration: BoxDecoration(
                            //                       borderRadius:
                            //                           BorderRadius.circular(10),
                            //                       color: const Color.fromRGBO(
                            //                           0, 149, 246, 1)),
                            //                   child: Text(
                            //                     'Seguir',
                            //                     style: GoogleFonts.quicksand(
                            //                         color: Colors.white),
                            //                   ),
                            //                 )
                            //               ],
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(left: 25),
                            //   child: Row(
                            //     children: [
                            //       Text(
                            //         'Powered by',
                            //         style: GoogleFonts.quicksand(color: Colors.white),
                            //       ),
                            //       SizedBox(
                            //         width: 15,
                            //       ),
                            //       SmoothPageIndicator(
                            //         controller: controller,
                            //         count: 3,
                            //         effect: const ExpandingDotsEffect(
                            //           dotHeight: 10,
                            //           dotWidth: 10,
                            //           activeDotColor: Color.fromRGBO(244, 27, 91, 1),
                            //           dotColor: Colors.white,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 15,
                            // )
                          ],
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => const MyApp2()),
                      //     );
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(vertical: 10),
                      //     width: double.infinity,
                      //     decoration: const BoxDecoration(boxShadow: [
                      //       BoxShadow(
                      //         offset: Offset(3, 0),
                      //         spreadRadius: -5,
                      //         blurRadius: 28,
                      //         color: Color.fromRGBO(0, 0, 0, .5),
                      //       ),
                      //     ], color: Color.fromRGBO(0, 228, 144, 1)),
                      //     child: Center(
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             'Recojer ecovaso el dia del evento',
                      //             style: GoogleFonts.quicksand(color: Colors.white),
                      //           ),
                      //           const SizedBox(
                      //             width: 10,
                      //           ),
                      //           const Icon(
                      //             FontAwesomeIcons.glassWater,
                      //             color: Colors.white,
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      authProvider.usuario.pulsera.isEmpty
                          ? GestureDetector(
                              onTap: authProvider.estadoSistemaStatus ==
                                      EstadoSistema.isAvailable
                                  ? () async {
                                      var res = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SimpleBarcodeScannerPage(
                                                    centerTitle: true,
                                                    appBarTitle: '♥9cLIENTE',
                                                    cancelButtonText:
                                                        'Cancelar',
                                                    lineColor: '#F41B5B',
                                                    scanType: ScanType.qr,
                                                    isShowFlashIcon: false),
                                          ));
                                      int len = res.length;
                                      if (res is String &&
                                          res != '-1' &&
                                          len > 0 &&
                                          len <= 4) {
                                        var request = await authProvider
                                            .sincronizarPulsera(
                                          numero: res,
                                        );
                                        if (request) {
                                          final snackBar = SnackBar(
                                            elevation: 10,
                                            content: Row(
                                              children: [
                                                const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  'Pulsera sincronizada',
                                                  style: GoogleFonts.quicksand(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 24, horizontal: 25),
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    244, 27, 91, 1),
                                            duration: const Duration(
                                                milliseconds: 2900),
                                          );

                                          // Find the ScaffoldMessenger in the widget tree
                                          // and use it to show a SnackBar.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          final snackBar = SnackBar(
                                            elevation: 10,
                                            content: Row(
                                              children: [
                                                const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  'Pulsera sincronizada en otro usuario',
                                                  style: GoogleFonts.quicksand(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 24, horizontal: 25),
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    244, 27, 91, 1),
                                            duration: const Duration(
                                                milliseconds: 2900),
                                          );

                                          // Find the ScaffoldMessenger in the widget tree
                                          // and use it to show a SnackBar.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      } else {
                                        final snackBar = SnackBar(
                                          elevation: 10,
                                          content: Row(
                                            children: [
                                              const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Formato incorrecto',
                                                style: GoogleFonts.quicksand(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 24, horizontal: 25),
                                          backgroundColor: const Color.fromRGBO(
                                              244, 27, 91, 1),
                                          duration: const Duration(
                                              milliseconds: 2900),
                                        );

                                        // Find the ScaffoldMessenger in the widget tree
                                        // and use it to show a SnackBar.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    }
                                  : () {
                                      final snackBar = SnackBar(
                                        elevation: 10,
                                        content: Row(
                                          children: [
                                            const Icon(
                                              Icons.block,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Funcion no disponible',
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 24, horizontal: 25),
                                        backgroundColor: const Color.fromRGBO(
                                            244, 27, 91, 1),
                                        duration:
                                            const Duration(milliseconds: 2900),
                                      );

                                      // Find the ScaffoldMessenger in the widget tree
                                      // and use it to show a SnackBar.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => const MyApp2()),
                                      // );
                                    },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: double.infinity,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    offset: Offset(3, 0),
                                    spreadRadius: -5,
                                    blurRadius: 28,
                                    color: Color.fromRGBO(0, 0, 0, .5),
                                  ),
                                ], color: Color.fromRGBO(244, 27, 91, 1)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sincronizar pulsera',
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.qr_code,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: double.infinity,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 0),
                                  spreadRadius: -5,
                                  blurRadius: 28,
                                  color: Color.fromRGBO(0, 0, 0, .5),
                                ),
                              ], color: Color.fromRGBO(244, 27, 91, 1)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pulsera sincronizada',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.done_all,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Line Up',
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              ('(${Statics
                                                      .listaParticipantes.length})'),
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white
                                                      .withOpacity(.5),
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: 130,
                                    child: ListView.separated(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final artista =
                                              Statics.listaParticipantes[index];
                                          return Participante(
                                            artista: artista,
                                          );
                                        },
                                        separatorBuilder: (_, __) => Container(
                                              width: 15,
                                            ),
                                        itemCount:
                                            Statics.listaParticipantes.length),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     const SizedBox(
                                  //       width: 25,
                                  //     ),
                                  //     Text(
                                  //       'Proximos eventos...',
                                  //       style: GoogleFonts.quicksand(
                                  //           color: Colors.white, fontSize: 20),
                                  //     ),
                                  //   ],
                                  // ),
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  // SizedBox(
                                  //   height: 140,
                                  //   child: ListView.separated(
                                  //     physics: const BouncingScrollPhysics(),
                                  //     padding:
                                  //         const EdgeInsets.symmetric(horizontal: 25),
                                  //     scrollDirection: Axis.horizontal,
                                  //     itemBuilder: (context, index) => EventosWidget(
                                  //       index: index,
                                  //     ),
                                  //     itemCount: 2,
                                  //     separatorBuilder: (_, __) => const SizedBox(
                                  //       width: 20,
                                  //     ),
                                  //   ),
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'TOTAL ACUMULADO',
                                        style: GoogleFonts.quicksand(
                                            color: const Color.fromRGBO(
                                                250, 180, 4, 1),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          authProvider.ocultarDineroEstado();
                                        },
                                        child: Text(
                                          '\$ ${authProvider.hideMoney == HideMoney.open ? authProvider.acumulado.toStringAsFixed(2) : '--.--'}',
                                          style: GoogleFonts.quicksand(
                                              color: Colors.white,
                                              fontSize: 60),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Builder(builder: (context) {
                                              String formattedDate =
                                                  DateFormat.yMMMEd('es-MX')
                                                      .add_jm()
                                                      .format(authProvider
                                                          .lastUpdate
                                                          .toLocal());
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      'ACTUALIZADO : $formattedDate',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.quicksand(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  244, 27, 91, 1),
                                              width: 1),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        244, 27, 91, 1),
                                                    width: 1),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/fondo.jpg'),
                                                    fit: BoxFit.cover)),
                                            child: PrettyQr(
                                              typeNumber: 3,
                                              image: const AssetImage(
                                                  'assets/images/logo3.png'),
                                              elementColor: Colors.white,
                                              size: 150,
                                              data: authProvider.usuario.uid,
                                              errorCorrectLevel:
                                                  QrErrorCorrectLevel.M,
                                              roundEdges: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                          child: Divider(
                                        color: Colors.white,
                                      )),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          'Gastos',
                                          style: GoogleFonts.quicksand(
                                              color: Colors.white,
                                              fontSize: 30),
                                        ),
                                      ),
                                      const Expanded(
                                          child: Divider(
                                        color: Colors.white,
                                      ))
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 35),
                                    child: Sparkline(
                                      useCubicSmoothing: true,
                                      fillMode: FillMode.below,
                                      fillGradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [
                                            .0,
                                            1
                                          ],
                                          colors: [
                                            Color.fromRGBO(244, 27, 91, 1),
                                            Color.fromRGBO(244, 27, 91, .01)
                                          ]),
                                      cubicSmoothingFactor: 0.2,
                                      pointColor: Colors.white,
                                      data: authProvider.listaSpark,
                                      lineGradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromRGBO(244, 27, 91, 1),
                                          Color.fromRGBO(250, 180, 4, 1)
                                        ],
                                      ),
                                      lineWidth: 3,
                                      enableGridLines: true,
                                      gridLineLabelPrecision: 6,
                                      gridLinelabelPrefix: '\$ ',
                                      gridLineWidth: 1,
                                      sharpCorners: true,
                                      gridLineLabelColor: Colors.white,
                                      gridLineColor:
                                          const Color.fromRGBO(244, 27, 91, .1),
                                      pointsMode: PointsMode.all,
                                      pointSize: 7.0,
                                      lineColor:
                                          const Color.fromRGBO(244, 27, 91, 1),
                                    ),
                                  ),
                                  ListView.separated(
                                    padding: const EdgeInsets.all(25),
                                    reverse: true,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) =>
                                        ConsumoWidget(
                                      venta:
                                          authProvider.listadoAcumulado[index],
                                    ),
                                    itemCount:
                                        authProvider.listadoAcumulado.length,
                                    separatorBuilder: (_, __) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      child: Divider(
                                        height: 2,
                                        color: Colors.white.withOpacity(.3),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(
                              Uri.parse(
                                  'https://www.instagram.com/juliosdfghjk/'),
                              mode: LaunchMode.externalApplication)) {
                            throw Exception(
                                'Could not launch https://www.instagram.com/juliosdfghjk/');
                          }
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 0),
                                  spreadRadius: -5,
                                  blurRadius: 28,
                                  color: Color.fromRGBO(0, 0, 0, .5),
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Powered by',
                                style: GoogleFonts.quicksand(
                                    color: Colors.grey, fontSize: 9),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.blue,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'juliosdfghjk',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                authProvider.usuario.socio
                    ? const DashboardAdminstradorView()
                    : Container()
              ],
            )));
  }
}
