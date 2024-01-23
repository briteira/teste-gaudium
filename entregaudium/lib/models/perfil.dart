import 'package:entregaudium/models/perfil_historico.dart';
import 'package:entregaudium/utils/string.dart';

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

  //Getters
  int get totalEntregas {
    return historico.fold<int>(0, (sum, historico) => sum + historico.qtd);
  }

  double get totalSaldo {
    return historico.fold<double>(0, (sum, historico) => sum + historico.valor);
  }

  String get totalSaldoFormatado {
    return StringUtil.doubleToString(totalSaldo);
  }

  double get nota {
    final somaAvaliacoes = historico.fold<int>(0, (sum, historico) => sum + historico.avaliacao);
    return somaAvaliacoes / historico.length; //Como a avaliação não é por produto e sim por entrega, deve ser dividido por histórico para obter a média
  }

  Perfil.fromJson(Map<String, dynamic> json) {
    nome = json['nome'] ?? '';
    cargo = json['cargo'] ?? '';
    descricao = json['descricao'] ?? '';
    historico = (json['historico'] as List<dynamic>? ?? [])
        .map((historicoJson) => PerfilHistorico.fromJson(historicoJson))
        .toList();
  }
}