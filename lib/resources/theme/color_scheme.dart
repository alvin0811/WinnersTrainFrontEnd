import 'package:flutter/material.dart';

class AppColor {
  static ColorScheme lightScheme = const ColorScheme(
    brightness: Brightness.light,
    background: Color(0XFFFAFAFA),
    primary: Color(0xffFFFFFF),
    onPrimary: Color(0xff121314),
    onPrimaryContainer: Color(0xff4C5157),
    secondary: Color(0XFF008B88),
    onSecondary: Color(0XFf48576E),
    error: Color(0XFFCE0E02),
    onError: Color(0XFFFFFFFF),
    onSurface: Color(0XFFCCCCCC),
    surface: Color(0xff141414),
    primaryContainer: Color(0xffFBF5EE),
    outline: Color(0XFF1213141A),
  );
  static Color dropShadow = Color(0xff2238500F);

  static LinearGradient secondaryButton = const LinearGradient(
      begin: Alignment(0, 1.1),
      end: Alignment(0, -1.3),
      colors: [
        Color(0xff008B88),
        Color(0xffE2CFCF),
      ]);

  static LinearGradient primaryButton = const LinearGradient(
    colors: [
      Color(0xff4C5157),
      Color(0xff121314),
    ],
    transform: GradientRotation(166 * (3.1415927 / 180)),
  );
}
