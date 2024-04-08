import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/common.dart';

class SplashController extends GetxController {
  RxBool isSplash = true.obs;
  RxBool fadeOutText = false.obs;

  /// For IntroDuction View
  final box = GetStorage();
  bool get isIntroductionViewEnable => box.read('showIntro') ?? true;
  void changeStatusOfIntroView(bool val) {
    box.write('showIntro', val);
  }

  /// activating Splash View
  activatingSplashView(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (isIntroductionViewEnable == false) {
        Get.offAllNamed(RoutesName.mainWrapperScreen);
      } else {
        Get.offAllNamed(RoutesName.introductionScreen);
      }
    });
  }

  /// activating fade Text on Splash view
  activatingFadeOutText() {
    Future.delayed(const Duration(milliseconds: 1800)).then((value) {
      fadeOutText.value = true;
    });
  }
}
