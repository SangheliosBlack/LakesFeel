// ignore_for_file: use_build_context_synchronously

import 'package:cashless/global/enviroment.dart';
import 'package:cashless/models/direccion.dart';
import 'package:cashless/models/usuario_cantidad.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:cashless/widgets/producto2.dart';
import 'package:cashless/widgets/tienda.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class DashboardVentaView extends StatefulWidget {
  const DashboardVentaView({super.key});

  @override
  State<DashboardVentaView> createState() => _DashboardVentaViewState();
}

class _DashboardVentaViewState extends State<DashboardVentaView> {
  String user = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          user.isEmpty
              ? GestureDetector(
                  onTap: () async {
                    var res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SimpleBarcodeScannerPage(
                              centerTitle: true,
                              appBarTitle: 'Cliente',
                              cancelButtonText: 'Cancelar',
                              lineColor: '#F41B5B',
                              scanType: ScanType.qr,
                              isShowFlashIcon: false),
                        ));
                    setState(() {
                      if (res is String && res != '-1') {
                        user = res;
                      }
                    });
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
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
                                'Escanear cliente    ',
                                style:
                                    GoogleFonts.quicksand(color: Colors.white),
                              ),
                              const Icon(
                                Icons.qr_code,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : FutureBuilder(
                  future: authProvider.obtenerUsuarioQr(id: user),
                  builder: (BuildContext context,
                      AsyncSnapshot<UsuarioCantidad?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        snapshot.connectionState == ConnectionState.done) {}
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      snapshot.connectionState == ConnectionState.waiting;
                    }

                    if (snapshot.data == null &&
                        snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Error',
                                style:
                                    GoogleFonts.quicksand(color: Colors.white),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.error,
                                color: Colors.white,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  user = '';
                                });
                                authProvider.eliminarCesta();
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(244, 27, 91, 1),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13),
                                child: Center(
                                  child: Text(
                                    'Cancelar',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      );
                    }
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    }
                    if (snapshot.data == null) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    }

                    var nombre = snapshot.data!.usuario.nombre.split(' ');

                    return Container(
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
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Cliente : ',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      nombre[0].isEmpty
                                          ? 'Desconocido'
                                          : nombre[0],
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
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
                                      'Saldo : ',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '\$ ${snapshot.data!.total.toStringAsFixed(2)}',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  user = '';
                                });
                                authProvider.eliminarCesta();
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(244, 27, 91, 1),
                                    borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13),
                                child: Center(
                                  child: Text(
                                    'Cancelar',
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    );
                  },
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
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  TiendaWidget(tienda: Statics.tiendas[index]),
              itemCount: Statics.tiendas.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
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
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 600),
                              opacity:
                                  authProvider.usuario.cesta.productos.isEmpty
                                      ? .2
                                      : 1,
                              child: GestureDetector(
                                onTap:
                                    authProvider.usuario.cesta.productos.isEmpty
                                        ? null
                                        : () {
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
          Stack(
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
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(244, 27, 91, .8)),
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
                                  '${authProvider.totalPiezas()}',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              'Productos',
                              style: GoogleFonts.quicksand(color: Colors.white),
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
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 700),
                      opacity: authProvider.usuario.cesta.productos.isEmpty ||
                              user.isEmpty
                          ? .2
                          : 1,
                      child: GestureDetector(
                        onTap: authProvider.usuario.cesta.productos.isEmpty ||
                                user.isEmpty 
                            ? null
                            : () async {
                                final data = await authProvider.crearPedido(
                                    abono: '0',
                                    apartado: false,
                                    liquidado: true,
                                    envio: 0,
                                    direccion: Direccion(
                                        id: '',
                                        coordenadas: Coordenadas(
                                            lat: 0,
                                            lng: 0,
                                            id: 'd',
                                            latitud: 0,
                                            longitud: 0),
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
                                          Icons.done,
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
                                } else {
                                  final snackBar = SnackBar(
                                    duration: const Duration(seconds: 3),
                                    backgroundColor: Colors.black,
                                    content: Row(
                                      children: [
                                        const Icon(
                                          Icons.priority_high,
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
                        child: AnimatedContainer(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(108, 2, 93, .5))),
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                            width:
                                authProvider.botonesEnvio == BotonesEnvios.send
                                    ? 55
                                    : width,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(108, 2, 93, 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: authProvider.botonesEnvio ==
                                      BotonesEnvios.send
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'Confirmar compra',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
                                    ),
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
        ],
      ),
    );
  }
}
