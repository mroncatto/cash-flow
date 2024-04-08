import 'package:cashflow/features/home_features/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../common/common.dart';

class HomeController extends GetxController {
  late final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  late AllTransactionModel cryptoData;
  RxInt currentChoiceIndex = 0.obs;
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('MMMM d EEEE yyyy');
  late String formatted;

  /// Fetching All Data Method for Top 10 Trending in market
  fetchTopMarketCapData() async {
    currentChoiceIndex.value = 0;

  }

  @override
  void onInit() {
    fetchTopMarketCapData();
    formatted = formatter.format(now);
    super.onInit();
  }

}
