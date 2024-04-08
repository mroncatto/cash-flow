import 'package:cashflow/features/base_features/mainwrapper_feature/presentation/controller/main_wrapper_controller.dart';
import 'package:cashflow/features/base_features/splash_feature/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

import '../common/common.dart';

class InitLocator implements Bindings {
  @override
  void dependencies() {
    /// Api
    Get.put<ApiProvider>(ApiProvider());

    /// Controllers
    Get.put<SplashController>(SplashController());
    Get.put<MainWrapperController>(MainWrapperController());
  }
}
