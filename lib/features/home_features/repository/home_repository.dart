import '../../../common/common.dart';
import '../../../config/config.dart';

class HomeRepository {
  final ApiProvider _apiProvider;

  HomeRepository(this._apiProvider);

  /// Get Top Market Data
  Future<dynamic> getTopMarketData() async {
    var response = await _apiProvider.get(ApiConstants.topMarketCapDataApi);

    return response;
  }

  /// Get Top Gainers Data
  Future<dynamic> getTopGainersData() async {
    var response = await _apiProvider.get(ApiConstants.topGainerDataApi);

    return response;
  }

  /// Get Top Losers Data
  Future<dynamic> getTopLosersData() async {
    var response = await _apiProvider.get(ApiConstants.topLosersDataApi);
    return response;
  }

  /// Get Top 10 Article
  Future<dynamic> getTop10Article() async {
    var response = await _apiProvider.get(ApiConstants.articleApi);
    return response;
  }
}
