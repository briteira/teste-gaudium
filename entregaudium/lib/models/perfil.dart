import 'package:entregaudium/models/perfil_historico.dart';

class Perfil {
  late String nome;
  late String cargo;
  late String descricao;
  late List<PerfilHistorico> historico;

  Perfil({
    required this.nome,
    required this.cargo,
    required this.descricao,
    required this.historico,
  });

  Perfil.fromJson(Map<String, dynamic> json) {
    nome = json['nome'] ?? '';
    cargo = json['cargo'] ?? '';
    descricao = json['descricao'] ?? '';
    historico = (json['historico'] as List<dynamic>? ?? [])
        .map((historicoJson) => PerfilHistorico.fromJson(historicoJson))
        .toList();
  }
}