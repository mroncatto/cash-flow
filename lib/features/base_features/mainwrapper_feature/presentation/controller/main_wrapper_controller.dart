import 'package:cashflow/features/accounts_feature/presentation/screen/accounts_view.dart';
import 'package:cashflow/features/home_features/presentation/screen/home_view.dart';
import 'package:cashflow/features/settings_feature/presentation/screen/settings_view.dart';
import 'package:cashflow/features/transactions_feature/presentation/screen/transactions_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainWrapperController extends GetxController {
  RxInt selectedIndexBottomNavBar = 0.obs;

  RxList<Widget> screens = [
    const HomeView(),
    const TransactionsView(),
    const HomeView(),
    const AccountsView(),
    const SettingsView(),
  ].obs;

  /// For Moving Between different screen
  PageController mainPageController = PageController(keepPage: true);

  PageController introPageViewController = PageController(initialPage: 0);
  RxInt introCurrentIndex = 0.obs;

  /// BNB index
  changeStatusBNB(int index) {
    selectedIndexBottomNavBar.value = index;
  }
}
