class AccountData {
  AccountData(
      {int? id,
      String? descricao,
      String? tipo,
      String? cor,
        String? currency,
      double? saldoInicial}) {
    _id = id;
    _descricao = descricao;
    _tipo = tipo;
    _cor = cor;
    _currency = currency;
    _saldoInicial = saldoInicial;
  }

  int? _id;
  String? _descricao;
  String? _tipo;
  String? _cor;
  String? _currency;
  double? _saldoInicial;

  String? get descricao => _descricao;
  String? get tipo => _tipo;
  String? get cor => _cor;
  String? get currency => _currency;
  double? get saldoInicial => _saldoInicial;

  AccountData.fromJson(dynamic json) {
    _id = json['id'];
    _descricao = json['descricao'];
    _tipo = json['tipo'];
    _cor = json['cor'];
    _currency = json['currency'];
    _saldoInicial = json['saldoInicial'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['descricaao'] = _descricao;
    map['tipo'] = _tipo;
    map['cor'] = _cor;
    map['currency'] = _currency;
    map['saldoInicial'] = _saldoInicial;
    return map;
  }

}
