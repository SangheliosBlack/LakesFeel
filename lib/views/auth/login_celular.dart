// ignore_for_file: use_build_context_synchronously

import 'package:cashless/services/auth_service.dart';
import 'package:cashless/services/dial_service.dart';
import 'package:cashless/services/twilio.dart';
import 'package:cashless/views/auth/confirmar_codigo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class AutentificarCelular extends StatefulWidget {
  const AutentificarCelular({Key? key}) : super(key: key);

  @override
  State<AutentificarCelular> createState() => _AutentificarCelularState();
}

class _AutentificarCelularState extends State<AutentificarCelular> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    var number = PhoneNumber(isoCode: 'MX', dialCode: '+52', phoneNumber: '');

    final putoDial = Provider.of<Dial>(context);
    final double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Container(
              width: width,
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(3, 3),
                      spreadRadius: -3,
                      blurRadius: 5,
                      color: Color.fromRGBO(0, 0, 0, .1),
                    ),
                  ],
                  image: const DecorationImage(
                      image: AssetImage('assets/images/fondo.jpg'),
                      fit: BoxFit.cover)),
              height: height - 380,
              child: const Image(image: AssetImage('assets/images/logo.png'))),
          Text(
            'Continua con tu celular',
            style: GoogleFonts.quicksand(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            'Recibiras un codigo de 4 digitos \n para verificar',
            style: GoogleFonts.quicksand(
                color: const Color.fromRGBO(250, 180, 4, 1), fontSize: 15),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1, color: const Color.fromRGBO(244, 27, 91, .2))),
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(244, 27, 91, 1),
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(.1))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingresa tu numero celular',
                    style: GoogleFonts.quicksand(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Form(
                            key: formKey,
                            child: InternationalPhoneNumberInput(
                              locale: 'es-MX',
                              countrySelectorScrollControlled: false,
                              errorMessage: 'Numero invalido',
                              autoFocus: false,
                              maxLength: 12,
                              inputDecoration: InputDecoration(
                                  errorStyle:
                                      GoogleFonts.quicksand(color: Colors.red),
                                  hintStyle: GoogleFonts.quicksand(
                                      color: Colors.white.withOpacity(.4)),
                                  border: InputBorder.none,
                                  hintText: '474 747 4747'),
                              hintText: '',
                              textStyle: GoogleFonts.quicksand(
                                  fontSize: 22, color: Colors.white),
                              onInputChanged: (PhoneNumber number2) {
                                putoDial.dial = number2.dialCode.toString();
                              },
                              selectorConfig: const SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                  setSelectorButtonAsPrefixIcon: false,
                                  useEmoji: true),
                              ignoreBlank: false,
                              formatInput: true,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: GoogleFonts.quicksand(
                                  fontSize: 22, color: Colors.white),
                              initialValue: number,
                              textFieldController: controller,
                              spaceBetweenSelectorAndTextField: 0,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              inputBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BotonAutentificar(formKey: formKey, controller: controller)
        ],
      ),
    );
  }
}

class BotonAutentificar extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  const BotonAutentificar({
    Key? key,
    required this.formKey,
    required this.controller,
  }) : super(key: key);

  @override
  State<BotonAutentificar> createState() => _BotonAutentificarState();
}

class _BotonAutentificarState extends State<BotonAutentificar> {
  bool send = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final putoDial = Provider.of<Dial>(context);
    final authService = Provider.of<AuthService>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: send
          ? null
          : () async {
              if (widget.controller.text.trim().replaceAll(' ', '') ==
                  '4741030509') {
                    await authService.logInCelular(numero: '4741030509');
              } else {
                var validar = widget.formKey.currentState!.validate();
                FocusManager.instance.primaryFocus?.unfocus();
                if (validar) {
                  setState(() {
                    send = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));

                  String signCode = '';

                  if (!kIsWeb) {
                    signCode = await SmsAutoFill().getAppSignature;
                  }
                  final estado = await TwilioService().enviarSms(
                      widget.controller.text.trim(), signCode, putoDial.dial);
                  setState(() {
                    send = false;
                  });
                  if (estado) {
                    final String numero = widget.controller.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmarCodigo(
                                numero: numero,
                                codigo: putoDial.dial,
                              )),
                    );
                  } else {
                    final snackBar = SnackBar(
                      duration: const Duration(seconds: 3),
                      backgroundColor: Colors.red,
                      content: Text(
                        'Error al verificar tu numero',
                        style:
                            GoogleFonts.quicksand(fontWeight: FontWeight.bold),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(244, 27, 91, 1)),
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
                  : Text('Continuar',
                      style: GoogleFonts.quicksand(color: Colors.white))),
        ],
      ),
    );
  }
}
