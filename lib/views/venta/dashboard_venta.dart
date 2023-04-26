import 'package:cashless/global/enviroment.dart';
import 'package:cashless/views/extras/prueba.dart';
import 'package:cashless/widgets/producto.dart';
import 'package:cashless/widgets/producto2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardVentaView extends StatelessWidget {
  const DashboardVentaView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
      body: Column(
        children: [
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
                        'Escanear cliente : ',
                        style: GoogleFonts.quicksand(color: Colors.white),
                      ),
                      Icon((Icons.qr_code))
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
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Productos',
                          style: GoogleFonts.quicksand(
                              color: Colors.white, fontSize: 25),
                        ),
                        const Divider(
                          color: Color.fromRGBO(244, 27, 91, 1),
                        ),
                      ],
                    ),
                  ),
                  GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      shrinkWrap: true,
                      mainAxisSpacing: 8.0,
                      children: List.generate(
                          Statics.listaProductoLakesFeel.length, (index) {
                        final producto = Statics.listaProductoLakesFeel[index];
                        return ProductoWidget(
                          producto: producto,
                        );
                      })),
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
                            Row(
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
                    itemBuilder: (context, index) =>
                        ProductoWidget2(index: index),
                    itemCount: 5,
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
                                '0 Productos',
                                style:
                                    GoogleFonts.quicksand(color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            '\$ 0.00',
                            style: GoogleFonts.quicksand(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
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
                              style: GoogleFonts.quicksand(color: Colors.white),
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
