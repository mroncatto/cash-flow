import 'package:cashflow/common/common.dart';
import 'package:cashflow/common/widgets/custom_appbar.dart';
import 'package:cashflow/features/base_features/splash_feature/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:switcher_button/switcher_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Settings",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              ListTile(
                leading: Text(
                  "Introduction Screen",
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: 15,
                  ),
                ),
                trailing: SwitcherButton(
                  onColor: theme.primaryColor,
                  offColor: theme.unselectedWidgetColor,
                  value: Get.find<SplashController>().isIntroductionViewEnable,
                  onChange: (value) {
                    Get.find<SplashController>().changeStatusOfIntroView(value);
                  },
                ),
              ),
              ListTile(
                leading: Text(
                  "Theme Mode",
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: 15,
                  ),
                ),
                trailing: SwitcherButton(
                  onColor: theme.primaryColor,
                  offColor: theme.unselectedWidgetColor,
                  value: Get.isDarkMode,
                  onChange: (value) {
                    ThemeHelper().switchTheme();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
