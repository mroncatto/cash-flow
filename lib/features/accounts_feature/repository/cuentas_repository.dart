import 'package:cashflow/common/models/common/moneda_data.dart';
import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';
import 'package:cashflow/common/models/cuenta_models/cuenta_tipo_data.dart';
import 'package:cashflow/config/constants/api_constants.dart';

import '../../../common/provider/api_provider.dart';

class CuentasRepository {
  final ApiProvider _apiProvider;

  CuentasRepository(this._apiProvider);

  List<MonedaData> getAllMonedas() {
    return [
      MonedaData(codigo: "USD", nombre: "Dólar Estadounidense", decimales: 2),
      MonedaData(codigo: "EUR", nombre: "Euro", decimales: 2),
      MonedaData(codigo: "PYG", nombre: "Guarani Paraguayo", decimales: 0),
      MonedaData(codigo: "ARS", nombre: "Peso Argentino", decimales: 2),
      MonedaData(codigo: "BRL", nombre: "Real Brasileño", decimales: 2),
      MonedaData(codigo: "EUR", nombre: "Peso Chileno", decimales: 0),
      MonedaData(codigo: "COP", nombre: "Peso Colombiano", decimales: 2),
    ];
  }

  List<CuentaTipoData> getAllTipoCuenta() {
    return [
      CuentaTipoData(id: "bank", tipo: "Banco"),
      CuentaTipoData(id: "wallet", tipo: "Billetera"),
    ];
  }

  Future<dynamic> getAllCuentas() async {
    //return await _db.getCuentas();
    return await _apiProvider.get(ApiConstants.cuentasApi);
  }

  Future<dynamic> getCuentaById(int id) async {
    return await _apiProvider.get("${ApiConstants.cuentasApi}/$id");
  }

  salvarCuenta(CuentaModel cuenta) async {
    return await _apiProvider.post(ApiConstants.cuentasApi, cuenta.toMap());
  }

  Future<dynamic> arquivarCuentaById(int? id) async {
    return await _apiProvider.put("${ApiConstants.cuentasApi}/$id");
  }
}
