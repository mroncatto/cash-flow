import 'package:cashflow/common/common.dart';
import 'package:cashflow/config/config.dart';

class AccountsRepository {
  final ApiProvider _apiProvider;

  AccountsRepository(this._apiProvider);

  Future<dynamic> getAllAcounts() async {
    return await _apiProvider.get(ApiConstants.AllAccountsApi);
  }

}