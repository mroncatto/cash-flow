import 'package:cashflow/features/accounts_feature/presentation/controller/detail_account_controller.dart';
import 'package:cashflow/features/accounts_feature/repository/accounts_details_repository.dart';
import 'package:get/get.dart';


class AccountDetailsLocator implements Bindings {
  @override
  void dependencies() {
    /// Repository
    Get.lazyPut<AccountDetailRepository>(
        () => AccountDetailRepository(Get.find()));

    /// Controller
    Get.lazyPut<DetailAccountController>(() => DetailAccountController(Get.find()));
    // Get.lazyPut<RelatedCoinNewsController>(
    //     () => RelatedCoinNewsController(Get.find()));
  }
}
