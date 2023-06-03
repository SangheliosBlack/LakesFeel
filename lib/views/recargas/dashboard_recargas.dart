// ignore_for_file: use_build_context_synchronously

import 'package:cashless/global/enviroment.dart';
import 'package:cashless/models/usuario_cantidad.dart';
import 'package:cashless/services/auth_service.dart';
import 'package:cashless/views/extras/mostrar_cargar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class DashBoardRecargasView extends StatefulWidget {
  const DashBoardRecargasView({super.key});

  @override
  State<DashBoardRecargasView> createState() => _DashBoardRecargasViewState();
}

class _DashBoardRecargasViewState extends State<DashBoardRecargasView> {
  String user = '';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Recargar a usuario',
          style: GoogleFonts.quicksand(color: Colors.white),
        ),
        actions: [
          GestureDetector(
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
            child: Container(
                margin: const EdgeInsets.only(right: 15),
                child: const Icon(Icons.qr_code_scanner)),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: user.isNotEmpty
                  ? FutureBuilder(
                      future: authService.obtenerUsuarioQr(id: user),
                      builder: (BuildContext context,
                          AsyncSnapshot<UsuarioCantidad?> snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            snapshot.connectionState == ConnectionState.done) {}
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          snapshot.connectionState == ConnectionState.waiting;
                        }

                        if (snapshot.data == null &&
                            snapshot.connectionState == ConnectionState.done) {
                          return Row(
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  user = '';
                                  authService.modificarCantidadRecarga(
                                      cantidad: 200);
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 25),
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(244, 27, 91, 1),
                                    borderRadius: BorderRadius.circular(100)),
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Cancelar',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                snapshot.data!.usuario.recargas.isEmpty
                                    ? Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 15),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          'Recarga minima de \$ 500.00',
                                          style: GoogleFonts.quicksand(
                                              color: Colors.white),
                                        ),
                                      )
                                    : Container(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          child: Text(
                                            snapshot.data!.usuario.nombre.isNotEmpty
                                                ? snapshot.data!.usuario.nombre
                                                : 'Usuario desconocido',
                                            style: GoogleFonts.quicksand(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pulsera ${snapshot.data!.usuario.pulsera.isEmpty ? "sin sincronizar" : "sincronizada"}',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white.withOpacity(.7),
                                          fontSize: 13),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.sync,
                                      color: Colors.white,
                                      size: 13,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            244, 27, 91, 1),
                                        width: 1),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
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
                                        data: snapshot.data!.usuario.uid,
                                        errorCorrectLevel:
                                            QrErrorCorrectLevel.M,
                                        roundEdges: true,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Agregaras la cantidad de :',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  snapshot.data!.usuario.recargas.isEmpty
                                      ? '\$ 500.00'
                                      : '\$ ${(authService.seleccion).toStringAsFixed(2)}',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white, fontSize: 40),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            snapshot.data!.usuario.recargas.isEmpty &&
                                    snapshot.data!.usuario.pulsera.isEmpty
                                ? Container()
                                : SizedBox(
                                    height: 60,
                                    child: ListView.separated(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            authService
                                                .modificarCantidadRecarga(
                                                    cantidad:
                                                        Statics.listaRecargas[
                                                            index]['cantidad']);
                                          },
                                          child: AnimatedContainer(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        Statics.listaRecargas[
                                                                        index][
                                                                    'cantidad'] ==
                                                                authService
                                                                    .seleccion
                                                            ? .4
                                                            : 0))),
                                            duration: const Duration(
                                                milliseconds: 300),
                                            child: Center(
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        0,
                                                        0,
                                                        0,
                                                        Statics.listaRecargas[index][
                                                                    'cantidad'] ==
                                                                authService
                                                                    .seleccion
                                                            ? 1
                                                            : 0),
                                                    borderRadius: BorderRadius.circular(
                                                        15),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Color.fromRGBO(
                                                            0,
                                                            0,
                                                            0,
                                                            Statics.listaRecargas[index]
                                                                        ['cantidad'] ==
                                                                    authService.seleccion
                                                                ? 1
                                                                : 0))),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 25),
                                                child: Text(
                                                  '\$ ${Statics.listaRecargas[index]['cantidad'].toString()}',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 22,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: Statics.listaRecargas.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(
                                        width: 10,
                                      ),
                                    ),
                                  ),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: 1,
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () async {
                                  mostrarCarga(context);
                                  var resp =
                                      await authService.agregarAbonoCliente(
                                    id: snapshot.data!.usuario.uid,
                                  );
                                  await Future.delayed(
                                      (const Duration(seconds: 1)));
                                  Navigator.pop(context);
                                  if (resp) {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        'Operacion realizada con exito',
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white),
                                      ),
                                      backgroundColor: Colors.black,
                                      duration:
                                          const Duration(milliseconds: 1900),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);

                                    setState(() {
                                      user = '';
                                    });
                                  } else {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        'Error al realizar la operacion.',
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white),
                                      ),
                                      backgroundColor: Colors.black,
                                      duration:
                                          const Duration(milliseconds: 1900),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                child: AnimatedContainer(
                                  width: authService.botonesEnvio ==
                                      BotonesEnvios.send
                                  ? 55
                                  : width,
                                  margin: const EdgeInsets.all(25),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      border: Border.all(
                                          width: 1,
                                          color: const Color.fromRGBO(
                                              244, 27, 91, .5))),
                                  duration: const Duration(milliseconds: 500),
                                  child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              244, 27, 91, 1),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Center(
                                child: authService.botonesEnvio ==
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
                              )),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  : Container(
                      width: double.infinity,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
