import 'package:cashflow/common/models/common/moneda_data.dart';

class AccountFormDataList {
  AccountFormDataList({Data? data}) {
    _data = data;
  }

  AccountFormDataList.fromJson(dynamic json) {
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
  Data({List<MonedaData>? monedaDataList}) {
    _monedaDataList = monedaDataList;
  }

  List<MonedaData>? _monedaDataList;
  List<MonedaData>? get monedaDataList => _monedaDataList;
  set monedaDataList(List<MonedaData>? monedaDataList) {
    _monedaDataList = monedaDataList;
  }

  Data.fromJson(dynamic json) {
    if (json['monedaList'] != null) {
      _monedaDataList = [];
      json['monedaList'].forEach((v) {
        _monedaDataList?.add(MonedaData.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_monedaDataList != null) {
      map['monedaList'] = _monedaDataList?.map((v) => v.toMap()).toList();
    }
    return map;
  }
}
