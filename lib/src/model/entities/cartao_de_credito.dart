class CartaoCredito {
  String? numero;
  String? nomeTitular;
  String? dataValidade;
  String? codigoSeguranca;

  CartaoCredito({
    this.numero,
    this.nomeTitular,
    this.dataValidade,
    this.codigoSeguranca,
  });

  Map<String, dynamic> toMap() {
    return {
      'numero': numero,
      'nomeTitular': nomeTitular,
      'dataValidade': dataValidade,
      'codigoSeguranca': codigoSeguranca,
    };
  }

  static CartaoCredito fromMap(Map<String, dynamic> map) {
    return CartaoCredito(
      numero: map['numero'],
      nomeTitular: map['nomeTitular'],
      dataValidade: map['dataValidade'],
      codigoSeguranca: map['codigoSeguranca'],
    );
  }
}
