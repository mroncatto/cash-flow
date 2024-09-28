import 'package:cashflow/features/accounts_feature/presentation/controller/accounts_controller.dart';
import 'package:cashflow/features/accounts_feature/repository/accounts_form_repository.dart';
import 'package:cashflow/features/accounts_feature/repository/accounts_repository.dart';
import 'package:cashflow/features/accounts_feature/repository/cuentas_repository.dart';
import 'package:cashflow/features/home_features/repository/home_repository.dart';
import 'package:cashflow/features/transactions_feature/presentation/controller/transactions_controller.dart';
import 'package:cashflow/features/transactions_feature/repository/transactions_repository.dart';
import 'package:get/get.dart';

import '../../accounts_feature/presentation/controller/account_form_controller.dart';
import '../../home_features/presentation/controller/home_controller.dart';

class MainWrapperLocator implements Bindings {
  @override
  void dependencies() {
    /// Helpers
    //Get.put<DatabaseHelper>(DatabaseHelper());

    /// Repository
    Get.put<HomeRepository>(HomeRepository(Get.find()));
    Get.put<TransactionsRepository>(TransactionsRepository(Get.find()));
    Get.put<AccountsRepository>(AccountsRepository(Get.find()));
    Get.put<CuentasRepository>(CuentasRepository(Get.find()));
    Get.put<AccountsFormRepository>(AccountsFormRepository(Get.find()));

    /// Controllers
    Get.put<HomeController>(HomeController(Get.find()));
    Get.put<TransactionsController>(TransactionsController(Get.find()));
    Get.put<AccountsController>(AccountsController(Get.find()));
    Get.put<AccountFormController>(AccountFormController(Get.find()));
  }
}
