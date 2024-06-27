import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common/routers/routes_name.dart';

class GetStartBtn extends StatelessWidget {
  const GetStartBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(RoutesName.mainWrapperScreen);
      },
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.06),
        width: size.width * 0.7,
        height: size.height * 0.075,
        decoration: BoxDecoration(
            color: theme.primaryColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            "Comece agora",
            style: GoogleFonts.ubuntu(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text(
          "Skip",
          style: GoogleFonts.ubuntu(
            fontSize: 18,
            color: Get.isDarkMode ? Colors.white : theme.primaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
