import 'package:cashless/global/enviroment.dart';
import 'package:cashless/models/usuario.dart';
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
  int seleccion = 100;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
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
                        appBarTitle: '♥9cLIENTE',
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
      body: Center(
          child: AnimatedSize(
        duration: const Duration(milliseconds: 800),
        child: user.isNotEmpty
            ? FutureBuilder(
                future: authService.obtenerUsuarioQr(id: user),
                builder:
                    (BuildContext context, AsyncSnapshot<Usuario?> snapshot) {
                  if (snapshot.data == null) {
                    return Container();
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
                            seleccion = 100;
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
                            style: GoogleFonts.quicksand(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            snapshot.data!.recargas.isEmpty
                                ? Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      'Recarga minima de \$ 500.00 para este usuario',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
                                    ),
                                  )
                                : Container(),
                            Text(
                              snapshot.data!.nombre,
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pulsera sincronizada',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white.withOpacity(.7),
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.sync,
                                  color: Colors.black,
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: const Color.fromRGBO(244, 27, 91, 1),
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
                                    data: snapshot.data!.uid,
                                    errorCorrectLevel: QrErrorCorrectLevel.M,
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
                              snapshot.data!.recargas.isEmpty
                                  ? '\$ 500.00'
                                  : seleccion == 100
                                      ? '+ \$ 0.00'
                                      : '+ \$ ${((seleccion + 1) * 100).toStringAsFixed(2)}',
                              style: GoogleFonts.quicksand(
                                  color: Colors.white, fontSize: 40),
                            )
                          ],
                        ),
                      ),
                      snapshot.data!.recargas.isEmpty
                          ? Container()
                          : SizedBox(
                              height: 60,
                              child: ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        seleccion = index;
                                      });
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
                                                  index == seleccion
                                                      ? .4
                                                      : 0))),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Center(
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0,
                                                  index == seleccion ? 1 : 0),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color.fromRGBO(
                                                      0,
                                                      0,
                                                      0,
                                                      index == seleccion
                                                          ? 1
                                                          : 0))),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 25),
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
                                separatorBuilder: (_, __) => const SizedBox(
                                  width: 10,
                                ),
                              ),
                            ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: snapshot.data!.recargas.isEmpty
                            ? 1
                            : seleccion == 100
                                ? .2
                                : 1,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: seleccion == 100 &&
                                  snapshot.data!.recargas.isNotEmpty
                              ? () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      'Seleccione una cantidad para continuar',
                                      style: GoogleFonts.quicksand(
                                          color: Colors.white),
                                    ),
                                    backgroundColor: Colors.black,
                                    duration:
                                        const Duration(milliseconds: 1900),
                                  );

                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              : () async {
                                  mostrarCarga(context);
                                  await authService.agregarAbonoCliente(
                                      id: snapshot.data!.uid,
                                      cantidad: snapshot.data!.recargas.isEmpty
                                          ? 500
                                          : (seleccion + 1) * 100);
                                  await Future.delayed(
                                      (const Duration(seconds: 1)));
                                  Navigator.pop(context);
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

                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);

                                  setState(() {
                                    user = '';
                                    seleccion = 100;
                                  });
                                },
                          child: Container(
                            margin: const EdgeInsets.all(25),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(244, 27, 91, .5))),
                            child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(244, 27, 91, 1),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Text(
                                    'Confirmar',
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
      )),
    );
  }
}
