import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstantsTextStyles {
  AppConstantsTextStyles._();
  static TextStyle splashTitle(Size size) => GoogleFonts.ubuntu(
        fontSize: size.height * 0.065,
        color: Colors.white,
      );
  static TextStyle splashTitleSecond(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.065,
      color: Colors.white,
      fontWeight: FontWeight.w500);
}
