import 'package:cashflow/features/base_features/mainwrapper_feature/presentation/controller/main_wrapper_controller.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../common/models/introduction_model.dart';
import '../../../../../common/helper/theme_helper.dart';
import '../components/introduction_com.dart';

class IntroDuctionView extends StatelessWidget {
  const IntroDuctionView({super.key});

  Widget animateDo(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    MainWrapperController mainWrapperController =
        Get.find<MainWrapperController>();
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

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
          appBar: _appBar(theme, size, mainWrapperController),
          backgroundColor: theme.scaffoldBackgroundColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Obx(
            () => Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.035),
              child: mainWrapperController.introCurrentIndex.value == 2

                  /// GET STARTED BTN
                  ? const GetStartBtn()

                  /// NEXT BUTTON
                  : SizedBox(
                      width: size.width * 0.17,
                      height: size.height * 0.1,
                      child: FloatingActionButton(
                        elevation: 2,
                        backgroundColor: theme.primaryColor,
                        onPressed: () {
                          if (mainWrapperController.introCurrentIndex.value != 2) {
                            mainWrapperController.introPageViewController
                                .animateToPage(
                                    mainWrapperController
                                                .introCurrentIndex.value ==
                                            0
                                        ? 1
                                        : 2,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastOutSlowIn);
                          }
                        },
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ),
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: PageView.builder(
                    controller: mainWrapperController.introPageViewController,
                    itemCount: introductionItems.length,
                    onPageChanged: (newValue) {
                      mainWrapperController.introCurrentIndex.value = newValue;
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Column(
                          children: [
                            /// IMG
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                size.height * 0.03,
                                size.height * 0.02,
                                size.height * 0.03,
                                size.height * 0.01,
                              ),
                              width: size.width,
                              height: size.height * 0.38,
                              child: animateDo(
                                index,
                                50,
                                Image.asset(
                                  introductionItems[index].img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            /// TITLE TEXT
                            Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    bottom: size.height * 0.01),
                                child: animateDo(
                                  index,
                                  100,
                                  Text(
                                    introductionItems[index].title,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 40,
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : theme.primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),

                            /// SUBTITLE TEXT
                            animateDo(
                              index,
                              200,
                              Text(
                                introductionItems[index].subTitle,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.ubuntu(
                                  fontSize: 15,
                                  color: Get.isDarkMode
                                      ? const Color.fromARGB(255, 218, 218, 218)
                                      : Colors.grey,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    alignment: Alignment.topCenter,
                    child: SmoothPageIndicator(
                      controller: mainWrapperController.introPageViewController,
                      count: introductionItems.length,
                      effect: ExpandingDotsEffect(
                        spacing: 6.0,
                        radius: 10.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        expansionFactor: 3.8,
                        dotColor: Colors.grey,
                        activeDotColor: theme.primaryColor,
                      ),
                      onDotClicked: (newValue) {
                        mainWrapperController.introCurrentIndex.value = newValue;
                        mainWrapperController.introPageViewController
                            .animateToPage(newValue,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                      },
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  AppBar _appBar(
      ThemeData theme, Size size, MainWrapperController mainWrapperController) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Obx(
        // ignore: unrelated_type_equality_checks
        () => mainWrapperController.introCurrentIndex == 2
            ? Container()
            : Padding(
                padding: EdgeInsets.only(left: size.width * 0.02),
                child: SkipBtn(
                  onTap: () {
                    mainWrapperController.introPageViewController.animateToPage(2,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn);
                  },
                ),
              ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: ThemeHelper().switchTheme,
            child: Icon(
              !Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              size: 29,
              color: theme.hintColor,
            ),
          ),
        ),
      ],
    );
  }
}
