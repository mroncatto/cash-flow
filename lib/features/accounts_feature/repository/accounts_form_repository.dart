import 'package:cashflow/common/common.dart';
import 'package:cashflow/config/config.dart';

class AccountsFormRepository {
  final ApiProvider _apiProvider;

  AccountsFormRepository(this._apiProvider);

  Future<dynamic> getAllMonedas() async {
    return await _apiProvider.get(ApiConstants.allMonedasApi);
  }

  Future<dynamic> crearConta(Map<String, dynamic> data) async {
    return await _apiProvider.post(ApiConstants.cuentasApi, data);
  }
}
