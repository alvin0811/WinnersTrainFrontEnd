import 'package:flutter/material.dart';

extension CustomBorder on Border {

  static Border dynamicBorder({required Color color, double? width}) =>
      Border.all(color: color, width: width?? 2);

  static Border thin({required Color color}) =>
      Border.all(color: color, width: 1);

  static Border medium({required Color color}) =>
      Border.all(color: color, width: 2);

  static Border thick({required Color color}) =>
      Border.all(color: color, width: 3);

  static Border colored({required Color color, double width = 2}) =>
      Border.all(color: color, width: width);

  static Border onlyTop({required Color color, double width = 2}) =>
      Border(
        top: BorderSide(color: color, width: width),
      );

  static Border onlyBottom({required Color color, double width = 2}) =>
      Border(
        bottom: BorderSide(color: color, width: width),
      );

  static Border onlyLeft({required Color color, double width = 2}) =>
      Border(
        left: BorderSide(color: color, width: width),
      );

  static Border onlyRight({required Color color, double width = 2}) =>
      Border(
        right: BorderSide(color: color, width: width),
      );

  static Border custom({
    required Color topColor,
    required Color bottomColor,
    required Color leftColor,
    required Color rightColor,
    double width = 2,
  }) =>
      Border(
        top: BorderSide(color: topColor, width: width),
        bottom: BorderSide(color: bottomColor, width: width),
        left: BorderSide(color: leftColor, width: width),
        right: BorderSide(color: rightColor, width: width),
      );
}
