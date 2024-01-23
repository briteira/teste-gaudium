import 'dart:convert';

import 'package:entregaudium/models/perfil_response.dart';
import 'package:http/http.dart' as http;

class ApiService {

  final String _baseUrl = 'https://dbgapi-gamadev.taximachine.com.br/ps/';

  late http.Client _http;

  ApiService({http.Client? client}) {
    // Caso não receba client, inicializa normalmente
    // Receber no construtor é ideal para testes unitários com mock
    _http = client ?? http.Client();
  }

  Future<PerfilResponse?> obterPerfil() async {
    var response = await _http.get(Uri.parse("${_baseUrl}perfil.php"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return PerfilResponse.fromJson(data);
    } else {
      throw json.decode(response.body);
    }
  }

}