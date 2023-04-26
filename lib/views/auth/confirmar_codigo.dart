import 'package:cashless/services/auth_service.dart';
import 'package:cashless/services/twilio.dart';
import 'package:cashless/views/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:sms_autofill/sms_autofill.dart';

class ConfirmarCodigo extends StatefulWidget {
  final String codigo;
  final String numero;

  const ConfirmarCodigo({Key? key, required this.numero, required this.codigo})
      : super(key: key);

  @override
  State<ConfirmarCodigo> createState() => _ConfirmarCodigoState();
}

class _ConfirmarCodigoState extends State<ConfirmarCodigo> with CodeAutoFill {
  bool send = false;

  String? appSignature;
  String? otpCode;
  final TextEditingController controller = TextEditingController();

  @override
  void codeUpdated() {
    final authService = Provider.of<AuthService>(context, listen: false);
    if (!mounted) return;
    setState(() {
      otpCode = code!;
      controller.text = otpCode!;
      checkCode(
        codigo: otpCode!,
        numero: widget.numero,
        authService: authService,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    listenForCode();
    SmsAutoFill().getAppSignature.then((signature) {
      if (!mounted) return;
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    cancel();
  }

  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final authService = Provider.of<AuthService>(context);
    return WillPopScope(
      onWillPop: () async => isDone,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: isDone ? 1 : 1,
              child: Container(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromRGBO(
                                          244, 27, 91, 1))),
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Regresar',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white),
                                ),
                                Text(
                                  'Numero equivocado',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Text(
                  'Codigo enviado al numero',
                  style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(250, 180, 4, 1),
                      fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.codigo}  ',
                      style: GoogleFonts.quicksand(
                        color: const Color.fromRGBO(244, 27, 91, 1),
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.numero,
                      style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.all(25),
              child: PinFieldAutoFill(
                keyboardType: TextInputType.number,
                controller: controller,
                autoFocus: false,
                onCodeChanged: (code) {},
                currentCode: otpCode ?? '',
                decoration: UnderlineDecoration(
                    lineHeight: 1,
                    lineStrokeCap: StrokeCap.square,
                    bgColorBuilder:
                        const FixedColorBuilder(Color.fromRGBO(244, 27, 91, 1)),
                    hintText: '0000',
                    hintTextStyle: GoogleFonts.quicksand(
                        color: Colors.white.withOpacity(1), fontSize: 30),
                    colorBuilder:
                        const FixedColorBuilder(Color.fromRGBO(250, 180, 4, 1)),
                    textStyle: GoogleFonts.quicksand(
                        color: Colors.white, fontSize: 30)),
                onCodeSubmitted: (valor) {},
                codeLength: 4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Reenvio de codigo en',
                  style: GoogleFonts.quicksand(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    SlideCountdown(
                      onDone: () async {
                        if (!mounted) return;
                        setState(() {
                          isDone = true;
                        });
                      },
                      fade: false,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(244, 27, 91, 1)),
                      duration: const Duration(minutes: 10),
                      textStyle: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Builder(builder: (_) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: send
                    ? null
                    : () {
                        if (controller.text.length == 4) {
                          checkCode(
                            codigo: controller.text.trim(),
                            numero: widget.numero,
                            authService: authService,
                          );
                        } else {
                          final snackBar = SnackBar(
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.black,
                            content: Text(
                              'Codigo invalido',
                              style: GoogleFonts.quicksand(color: Colors.white),
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: send ? 50 : width - 50,
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(244, 27, 91, 1)),
                            borderRadius: send
                                ? BorderRadius.circular(100)
                                : BorderRadius.circular(25)),
                        child: send
                            ? const SizedBox(
                                width: 19,
                                height: 19,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                ),
                              )
                            : Text('Verificar',
                                style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600))),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  checkCode({
    required String codigo,
    required String numero,
    required AuthService authService,
  }) async {
    if (!mounted) return;
    setState(() {
      send = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    if (codigo.length >= 3) {
      final confirmado =
          await TwilioService().confirmarSms(numero, codigo, widget.codigo);
      if (confirmado) {
        final logIn = await authService.logInCelular(numero: numero);
        if (!mounted) return;
        setState(() {
          send = false;
        });
        if (!logIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RegisterView(numero: numero, dialCode: widget.codigo)),
          );
        } else {
          Navigator.pop(context);
        }
      } else {
        if (!mounted) return;
        setState(() {
          send = false;
        });
        final snackBar = SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.black,
          content: Text(
            'Codigo incorrecto',
            style: GoogleFonts.quicksand(color: Colors.white),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      if (!mounted) return;
      setState(() {
        send = false;
      });
    }
  }
}
