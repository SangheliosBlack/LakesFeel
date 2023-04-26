import 'dart:convert';

import 'package:cashless/global/enviroment.dart';
import 'package:cashless/models/twilio_response.dart';
import 'package:http/http.dart' as http;

class TwilioService {
  TwilioService._privateConstructor();
  static final TwilioService _instace = TwilioService._privateConstructor();
  factory TwilioService() {
    return _instace;
  }

  Future<bool> enviarSms(String numero, String hash, String codigo) async {
    final data = {'to': numero, 'hash': hash, 'codigo': codigo};
    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/twilio/enviarSMS'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
          });
      if (resp.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> confirmarSms(String numero, String codigo, String area) async {
    final data = {'to': numero, 'code': codigo, 'codigo': area};
    try {
      final resp = await http.post(
          Uri.parse('${Statics.apiUrl}/twilio/verificarSms'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
          });
      if (resp.statusCode == 200) {
        final dataParse = twilioResponseFromJson(resp.body);
        if (dataParse.valid) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
