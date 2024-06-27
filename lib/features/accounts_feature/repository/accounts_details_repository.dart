import 'package:cashflow/common/common.dart';
import 'package:cashflow/config/config.dart';

class AccountDetailRepository {
  final ApiProvider _apiProvider;

  AccountDetailRepository(this._apiProvider);
  
  Future<dynamic> getAccountById(accountId) async {
    return await _apiProvider.get("${ApiConstants.accountsByIdApi}/$accountId");
  }

}