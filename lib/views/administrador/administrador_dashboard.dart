// ignore_for_file: deprecated_member_use

import 'package:cashless/packages/sparkline.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardAdminstradorView extends StatefulWidget {
  const DashboardAdminstradorView({super.key});

  @override
  State<DashboardAdminstradorView> createState() =>
      _DashboardAdminstradorViewState();
}

class _DashboardAdminstradorViewState extends State<DashboardAdminstradorView> {
  FlutterInsta flutterInsta = FlutterInsta();

  @override
  void initState() {
    final authProvider = Provider.of<AuthService>(context, listen: false);

    authProvider.adminData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthService>(context);
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: RefreshIndicator(
              onRefresh: () async {
                await authProvider.adminData();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: height - 115,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 25),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  offset: Offset(0, 0),
                                                  spreadRadius: -3,
                                                  blurRadius: 5,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, .4),
                                                ),
                                              ],
                                              color: Colors.black,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '\$ ${authProvider.admin.ventas.toStringAsFixed(2)}',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 22,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Ventas',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 13,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                  offset: Offset(0, 0),
                                                  spreadRadius: -3,
                                                  blurRadius: 5,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, .4),
                                                ),
                                              ],
                                              color: Colors.black,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '\$ ${authProvider.admin.recargas.toStringAsFixed(2)}',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 22,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Recargas',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 13,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 0),
                                                spreadRadius: -3,
                                                blurRadius: 5,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, .4),
                                              ),
                                            ],
                                            color: Colors.black,
                                          ),
                                          height: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${authProvider.admin.pulseras}',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Entradas',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 13,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                offset: Offset(0, 0),
                                                spreadRadius: -3,
                                                blurRadius: 5,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, .4),
                                              ),
                                            ],
                                            color: Colors.black,
                                          ),
                                          height: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '0 / 32',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 22,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Equipo',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 13,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 5),
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 0),
                                          spreadRadius: -3,
                                          blurRadius: 5,
                                          color: Color.fromRGBO(0, 0, 0, .4),
                                        ),
                                      ],
                                      color:
                                          const Color.fromRGBO(244, 27, 91, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'TOTAL ACUMULADO :',
                                            style: GoogleFonts.quicksand(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '\$ ${authProvider.admin.ventas.toStringAsFixed(2)}',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.white.withOpacity(.5),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
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
                                              Color.fromRGBO(250, 180, 4, 1),
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
                                          gridLineColor: const Color.fromRGBO(
                                              244, 27, 91, .1),
                                          pointsMode: PointsMode.all,
                                          pointSize: 7.0,
                                          lineColor: const Color.fromRGBO(
                                              244, 27, 91, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 25),
                                  margin: const EdgeInsets.only(
                                      top: 0, left: 25, right: 25, bottom: 25),
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 0),
                                          spreadRadius: -3,
                                          blurRadius: 5,
                                          color: Color.fromRGBO(0, 0, 0, .4),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Usuarios sincronizados',
                                            style: GoogleFonts.quicksand(
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '${authProvider.admin.usuarios}',
                                            style: GoogleFonts.quicksand(
                                                color: const Color.fromRGBO(
                                                    244, 27, 91, 1)),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      LinearPercentIndicator(
                                        padding: const EdgeInsets.all(0),
                                        lineHeight: 35.0,
                                        barRadius: const Radius.circular(15),
                                        percent: authProvider.admin.pulseras /
                                            authProvider.admin.usuarios,
                                        center: Text(
                                          "${(authProvider.admin.pulseras / authProvider.admin.usuarios).toStringAsFixed(2)}%",
                                          style: GoogleFonts.quicksand(
                                              color: Colors.white),
                                        ),
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        backgroundColor: const Color.fromRGBO(
                                            244, 27, 91, .6),
                                        progressColor: const Color.fromRGBO(
                                            244, 27, 91, 1),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Restantes',
                                            style: GoogleFonts.quicksand(
                                                color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            (authProvider.admin.usuarios -
                                                    authProvider.admin.pulseras)
                                                .toString(),
                                            style: GoogleFonts.quicksand(
                                                color: const Color.fromRGBO(
                                                    244, 27, 91, 1)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
