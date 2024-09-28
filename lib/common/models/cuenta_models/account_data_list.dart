import 'package:cashflow/common/models/cuenta_models/account_data.dart';

class AccountDataList {
  AccountDataList({Data? data}) {
    _data = data;
  }

  AccountDataList.fromJson(dynamic json) {
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
  Data({List<AccountData>? accountDataList, String? totalCount}) {
    _accountDataList = accountDataList;
    _totalCount = totalCount;
  }

  Data.fromJson(dynamic json) {
    if (json['accountList'] != null) {
      _accountDataList = [];
      json['accountList'].forEach((v) {
        _accountDataList?.add(AccountData.fromJson(v));
      });
    }
    _totalCount = "4";
  }

  List<AccountData>? _accountDataList;
  String? _totalCount;

  List<AccountData>? get accountDataList => _accountDataList;
  String? get totalCount => _totalCount;

  set accountDataList(List<AccountData>? value) {
    _accountDataList = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_accountDataList != null) {
      map['accountList'] = _accountDataList?.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = _totalCount;
    return map;
  }
}
