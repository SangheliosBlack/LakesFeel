import 'package:cashless/global/enviroment.dart';
import 'package:cashless/models/direccion.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:cashless/views/extras/prueba.dart';
import 'package:cashless/widgets/producto.dart';
import 'package:cashless/widgets/producto2.dart';
import 'package:cashless/widgets/tienda.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardVentaView extends StatelessWidget {
  const DashboardVentaView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 15),
          //   width: double.infinity,
          //   decoration: const BoxDecoration(boxShadow: [
          //     BoxShadow(
          //       offset: Offset(3, 0),
          //       spreadRadius: -5,
          //       blurRadius: 28,
          //       color: Color.fromRGBO(0, 0, 0, .5),
          //     ),
          //   ], color: Colors.black),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 25),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Row(
          //           children: [
          //             Text(
          //               'Escanear cliente : ',
          //               style: GoogleFonts.quicksand(color: Colors.white),
          //             ),
          //             Icon((Icons.qr_code))
          //           ],
          //         ),
          //         Container(
          //           width: 1,
          //           height: 20,
          //           color: const Color.fromRGBO(244, 27, 91, 1),
          //         ),
          //         Row(
          //           children: [
          //             Text(
          //               'Saldo restante : ',
          //               style: GoogleFonts.quicksand(color: Colors.white),
          //             ),
          //             Text(
          //               '\$ 120.00',
          //               style: GoogleFonts.quicksand(color: Colors.white),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                offset: Offset(3, 0),
                spreadRadius: -5,
                blurRadius: 28,
                color: Color.fromRGBO(0, 0, 0, .5),
              ),
            ], color: Colors.black),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Cliente : ',
                        style: GoogleFonts.quicksand(color: Colors.white),
                      ),
                      Text(
                        'Julio',
                        style: GoogleFonts.quicksand(color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    color: const Color.fromRGBO(244, 27, 91, 1),
                  ),
                  Row(
                    children: [
                      Text(
                        'Saldo restante : ',
                        style: GoogleFonts.quicksand(color: Colors.white),
                      ),
                      Text(
                        '\$ 120.00',
                        style: GoogleFonts.quicksand(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Disponible',
                  style:
                      GoogleFonts.quicksand(color: Colors.white, fontSize: 25),
                ),
                const Divider(
                  color: Color.fromRGBO(244, 27, 91, 1),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 153,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  TiendaWidget(tienda: Statics.tiendas[index]),
              itemCount: Statics.tiendas.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 20,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 0, left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Resumen',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 25),
                            ),
                            GestureDetector(
                              onTap: () {
                                authProvider.eliminarCesta();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Eliminar',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          color: Color.fromRGBO(244, 27, 91, 1),
                        ),
                      ],
                    ),
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.all(25),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => ProductoWidget2(
                      producto: authProvider.usuario.cesta.productos[index],
                      index: index,
                    ),
                    itemCount: authProvider.usuario.cesta.productos.length,
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp2()),
              );
            },
            child: Stack(
              children: [
                Container(
                    height: 140,
                    width: width,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: -5,
                        blurRadius: 28,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ]),
                    child: const Image(
                      image: AssetImage('assets/images/fondo.jpg'),
                      fit: BoxFit.cover,
                    )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(244, 27, 91, .8)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Center(
                                  child: Text(
                                    'B1',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Text(
                                '${authProvider.totalPiezas()} Productos',
                                style:
                                    GoogleFonts.quicksand(color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            '\$ ${authProvider.calcularTotal().toStringAsFixed(2)}',
                            style: GoogleFonts.quicksand(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          final data = await authProvider.crearPedido(
                              abono: '0',
                              apartado: false,
                              liquidado: true,
                              envio: 0,
                              direccion: Direccion(
                                  id: '',
                                  coordenadas:
                                      Coordenadas(lat: 0, lng: 0, id: 'd'),
                                  predeterminado: false,
                                  titulo: ''),
                              customer: '',
                              tiendaRopa: true,
                              listadoEnviosValores: []);

                          if (data != null) {
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 3),
                              backgroundColor: Colors.black,
                              content: Row(
                                children: [
                                  const Icon(
                                    Icons.print_disabled,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Venta realizada con exito',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }else{
                            final snackBar = SnackBar(
                                        duration: const Duration(seconds: 3),
                                        backgroundColor: Colors.black,
                                        content: Row(
                                          children: [
                                            const Icon(
                                              Icons.print_disabled,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Saldo insuficiente',
                                              style: GoogleFonts.quicksand(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(108, 2, 93, .5))),
                          child: Container(
                            width: width,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(108, 2, 93, 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text(
                                'Confirmar compra',
                                style:
                                    GoogleFonts.quicksand(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
