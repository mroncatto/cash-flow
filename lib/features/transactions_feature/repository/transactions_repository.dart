import 'package:cashflow/common/common.dart';
import 'package:cashflow/config/config.dart';

class TransactionsRepository {
  final ApiProvider _apiProvider;

  TransactionsRepository(this._apiProvider);


  Future<dynamic> getTopMarketData() async {
      return await _apiProvider.get(ApiConstants.topMarketCapDataApi);
  }
  
  
  Future<dynamic> getAllMonthTransactions() async {
    return await _apiProvider.get(ApiConstants.allTransactionsApi);
  }

}