import 'package:cashless/models/producto.dart';
import 'package:cashless/models/venta_response.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PedidoView extends StatelessWidget {
  final Venta venta;

  const PedidoView({Key? key, required this.venta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
      appBar: AppBar(
        title: Text(
          'Regresar',
          textAlign: TextAlign.start,
          style: GoogleFonts.quicksand(color: Colors.white, fontSize: 17),
        ),
        toolbarHeight: 65,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 25),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, int index) =>
                        EstadoWidget(pedido: venta.pedidos[index]),
                    itemCount: venta.pedidos.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 80,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Divider(
                          color: Colors.black.withOpacity(.1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total :',
                              style: GoogleFonts.quicksand(
                                  fontSize: 30, color: Colors.white),
                            ),
                            Text(
                              '\$ ${venta.total.toStringAsFixed(2)}',
                              style: GoogleFonts.quicksand(
                                fontSize: 30,
                                color: const Color.fromRGBO(250, 180, 4, 1),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EstadoWidget extends StatelessWidget {
  final bool done;
  final PedidoProducto pedido;
  const EstadoWidget({Key? key, required this.pedido, this.done = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text = pedido.codigoCliente;
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Detalles',
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 35),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Producto',
                  style: GoogleFonts.quicksand(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Precio',
                  style: GoogleFonts.quicksand(color: Colors.white),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'C',
                  style: GoogleFonts.quicksand(color: Colors.white),
                ),
                const SizedBox(
                  width: 26,
                ),
              ],
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(width: 1, color: const Color.fromRGBO(244, 27, 91, 1))),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => ItemPedidoWidget(
              producto: pedido.productos[index],
            ),
            itemCount: pedido.productos.length,
            separatorBuilder: (BuildContext context, int index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.withOpacity(.2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemPedidoWidget extends StatelessWidget {
  final Producto producto;

  const ItemPedidoWidget({
    Key? key,
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '- ${producto.nombre}',
                overflow: TextOverflow.visible,
                style: GoogleFonts.quicksand(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${producto.precio.toStringAsFixed(2)}',
                    style: GoogleFonts.quicksand(
                        color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    width: 32,
                    child: Center(
                      child: Text(
                        producto.cantidad.toString(),
                        style: GoogleFonts.quicksand(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
