import 'dart:convert';

import 'package:http/http.dart';

abstract class RequestHandler {
  static Future handleResponse(Response response) async {
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;

      default:
        throw 'Não foi possível completar requisição';
    }
  }
}
