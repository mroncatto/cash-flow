class MonedaData {
  MonedaData(
      {required String codigo,
      required String nombre,
      required int decimales}) {
    _codigo = codigo;
    _nombre = nombre;
    _decimales = decimales;
  }

  String _codigo = "";
  String _nombre = "";
  int _decimales = 0;

  String get codigo => _codigo;
  String get nombre => _nombre;
  int get decimales => _decimales;

  set codigo(String value) {
    _codigo = value;
  }

  MonedaData.fromMap(dynamic json) {
    _codigo = json['codigo'];
    _nombre = json['nombre'];
    _decimales = json['decimales'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['codigo'] = _codigo;
    map['nombre'] = _nombre;
    map['decimales'] = _decimales;
    return map;
  }
}
