import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle heading({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 20.sp,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? const Color(0xff121314),
    );
  }

  static TextStyle subHeading({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 18.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? const Color(0xff121314),
    );
  }

  static TextStyle body({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? const Color(0xff121314),
    );
  }

  static TextStyle small({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 12.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? const Color(0xff7A7A7A),
    );
  }

  static TextStyle hint({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? Colors.grey.shade500,
    );
  }

  static TextStyle button({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? Color(0xff121314),
    );
  }
}
