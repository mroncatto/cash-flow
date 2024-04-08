import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../../common/helper/helper.dart';
import '../controller/main_wrapper_controller.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final MainWrapperController mainWrapperController =
      Get.find<MainWrapperController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var size = MediaQuery.of(context).size;

    ThemeHelper.changeThemeStatus(
      context: context,
      systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
      systemNavigationBarIconBrightness:
          Get.isDarkMode ? Brightness.light : Brightness.dark,
      statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      statusBarIconBrightness:
          Get.isDarkMode ? Brightness.light : Brightness.dark,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        // appBar: MyAppBar(),
        body: PageView(
          onPageChanged: (newVal) {
            mainWrapperController.changeStatusBNB(newVal);
          },
          physics: const NeverScrollableScrollPhysics(),
          controller: mainWrapperController.mainPageController,
          children: mainWrapperController.screens,
        ),
        bottomNavigationBar: Obx(
              () => SizedBox(
            width: size.width,
            height: size.height * 0.1101,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const BottomNews(),
                BottomAppBar(
                  color: theme.scaffoldBackgroundColor,
                  elevation: 0,
                  notchMargin: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _bottomAppBarItem(
                          icon: mainWrapperController
                              .selectedIndexBottomNavBar.value ==
                              0
                              ? IconlyBold.home
                              : IconlyLight.home,
                          page: 0,
                          context,
                          label: "Home",
                        ),
                        _bottomAppBarItem(
                            icon: mainWrapperController
                                .selectedIndexBottomNavBar.value ==
                                1
                                ? IconlyBold.chart
                                : IconlyLight.chart,
                            page: 1,
                            context,
                            label: "Transactions"),
                        _bottomAppBarItem(
                            icon: mainWrapperController
                                .selectedIndexBottomNavBar.value ==
                                2
                                ? Icons.flag
                                : Icons.flag,
                            page: 2,
                            context,
                            label: "Budget"),
                        _bottomAppBarItem(
                            icon: mainWrapperController
                                .selectedIndexBottomNavBar.value ==
                                3
                                ? Icons.account_balance
                                : Icons.account_balance,
                            page: 3,
                            context,
                            label: "Account"),
                        _bottomAppBarItem(
                            icon: mainWrapperController
                                .selectedIndexBottomNavBar.value ==
                                4
                                ? IconlyBold.setting
                                : IconlyLight.setting,
                            page: 4,
                            context,
                            label: "Settings"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
      child: GestureDetector(
        onTap: () {
          mainWrapperController.changeStatusBNB(page);
          mainWrapperController.mainPageController.jumpToPage(
            mainWrapperController.selectedIndexBottomNavBar.value,
          );
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: mainWrapperController.selectedIndexBottomNavBar.value ==
                        page
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                size: 23,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                label,
                style: TextStyle(
                    color:
                        mainWrapperController.selectedIndexBottomNavBar.value ==
                                page
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                    fontSize: mainWrapperController.selectedIndexBottomNavBar.value ==
                        page
                    ? 13
                    : 12,
                    fontWeight:
                        mainWrapperController.selectedIndexBottomNavBar.value ==
                                page
                            ? FontWeight.w600
                            : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
