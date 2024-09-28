import 'package:cashflow/common/models/common/moneda_data.dart';
import 'package:cashflow/common/models/cuenta_models/cuenta_tipo_data.dart';
import 'package:flutter/material.dart';

class CuentaModel {
  final int? id;
  final String descripcion;
  final CuentaTipoData tipo;
  final String color;
  final MonedaData moneda;
  final bool activo;
  final double saldo;

  CuentaModel(
      {this.id,
      required this.descripcion,
      required this.tipo,
      required this.color,
      required this.moneda,
      required this.activo,
      required this.saldo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descripcion': descripcion,
      'tipo': tipo,
      'color': color,
      'moneda': moneda,
      'activo': activo,
      'saldo': saldo
    };
  }

  factory CuentaModel.fromMap(Map<String, dynamic> map) {
    return CuentaModel(
      id: map['id'],
      descripcion: map['descripcion'],
      tipo: CuentaTipoData.fromMap(map['tipo']),
      color: map['color'],
      moneda: MonedaData.fromMap(map['moneda']),
      activo: map['activo'],
      saldo: map['saldo'].toDouble(),
    );
  }

  IconData toIcon() {
    final map = <String, dynamic>{};
    map['bank'] = Icons.account_balance;
    map['wallet'] = Icons.wallet;

    if (map.containsKey(tipo.tipo)) {
      return map[tipo.tipo];
    }

    return Icons.account_balance;
  }

  String? toType() {
    final map = <String, String>{};
    map['bank'] = "Banco";
    map['wallet'] = "Carteira";

    if (map.containsKey(tipo.tipo)) {
      return map[tipo.tipo];
    }

    return "Banco";
  }
}
