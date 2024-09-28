import 'package:cashflow/features/accounts_feature/presentation/controller/account_view_controller.dart';
import 'package:cashflow/features/accounts_feature/repository/accounts_details_repository.dart';
import 'package:get/get.dart';

class AccountDetailsLocator implements Bindings {
  @override
  void dependencies() {
    /// Repository
    Get.lazyPut<AccountDetailRepository>(
        () => AccountDetailRepository(Get.find()));

    /// Controller
    Get.lazyPut<AccountViewController>(() => AccountViewController(Get.find()));
    // Get.lazyPut<RelatedCoinNewsController>(
    //     () => RelatedCoinNewsController(Get.find()));
  }
}
