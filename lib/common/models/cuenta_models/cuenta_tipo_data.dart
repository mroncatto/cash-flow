class CuentaTipoData {
  CuentaTipoData({required String id, required String tipo}) {
    _id = id;
    _tipo = tipo;
  }

  String _id = "";
  String _tipo = "";

  String get id => _id;
  String get tipo => _tipo;

  set id(String value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'tipo': tipo};
  }

  factory CuentaTipoData.fromMap(Map<String, dynamic> map) {
    return CuentaTipoData(
      id: map['id'],
      tipo: map['tipo'],
    );
  }
}
