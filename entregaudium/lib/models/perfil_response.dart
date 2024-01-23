import 'package:entregaudium/models/perfil.dart';

class PerfilResponse {
  late String success;
  late Perfil response;

  PerfilResponse({
    required this.success,
    required this.response,
  });

  PerfilResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? 'false';
    response = Perfil.fromJson(json['response'] ?? {});
  }
}