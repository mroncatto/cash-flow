import 'package:cashflow/features/home_features/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';

/// Header
class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: SizedBox(
          height: size.height * 0.09,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "H2S",
                    child: Text(
                      AppConstantsStrings.appName,
                      style:
                          theme.textTheme.displayLarge!.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Hero(
                    tag: "H2D",
                    child: Text(
                      Get.find<HomeController>().formatted,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  //Get.toNamed(RoutesName.developerProfileScreen);
                },
                child: Hero(
                    tag: "1",
                    child: Container(
                      width: size.width * 0.16,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/main.png'),
                        ),
                      ),
                    )),
              ),
            ],
          )),
    );
  }
}
