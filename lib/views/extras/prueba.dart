import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String qr = '';
  bool camState = false;
  bool dirState = false;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Back"),
                Switch(
                    value: dirState,
                    onChanged: (val) => setState(() => dirState = val)),
                Text("Front"),
              ],
            ),
            Expanded(
                child: camState
                    ? Center(
                        child: SizedBox(
                          width: 300.0,
                          height: 600.0,
                          child: QrCamera(
                            onError: (context, error) => Text(
                              error.toString(),
                              style: TextStyle(color: Colors.red),
                            ),
                            formats: [BarcodeFormats.QR_CODE],
                            qrCodeCallback: (code) {
                              print('dasdasdasdasdasdasasdadadasdasdasdasdada');
                              setState(() {
                                qr = code!;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 10.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(child: Text("Camera inactive"))),
            Text("QRCODE: $qr"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text(
            "on/off",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            setState(() {
              camState = !camState;
            });
          }),
    );
  }
}