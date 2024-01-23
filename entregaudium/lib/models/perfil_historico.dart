class PerfilHistorico {
  late String quando;
  late double valor;
  late int qtd;
  late int avaliacao;

  PerfilHistorico({
    required this.quando,
    required this.valor,
    required this.qtd,
    required this.avaliacao,
  });

  PerfilHistorico.fromJson(Map<String, dynamic> json) {
    quando = json['quando'] ?? '';
    valor = (json['valor'] as num?)?.toDouble() ?? 0.0;
    qtd = json['qtd'] ?? 0;
    avaliacao = json['avaliacao'];
  }
}