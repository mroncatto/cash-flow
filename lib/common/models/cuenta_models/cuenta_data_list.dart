import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';

class CuentaDataList {
  CuentaDataList({Data? data}) {
    _data = data;
  }

  CuentaDataList.fromMap(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? _data;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({List<CuentaModel>? cuentaList}) {
    _cuentaList = cuentaList;
  }

  List<CuentaModel>? _cuentaList;
  List<CuentaModel>? get cuentaList => _cuentaList;

  Data.fromJson(dynamic json) {
    if (json['cuentas'] != null) {
      _cuentaList = [];
      json['cuentas'].forEach((v) {
        _cuentaList?.add(CuentaModel.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cuentaList != null) {
      map['cuentas'] = _cuentaList?.map((v) => v.toMap()).toList();
    }
    return map;
  }
}
