import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class S {
  static Widget verticalSpace(double height) => SizedBox(height: height.h);

  static Widget horizontalSpace(double width) => SizedBox(width: width.w);
  
  //Vertical Spacing
  static final Widget v10 = verticalSpace(10);
  static final Widget v20 = verticalSpace(20);
  static final Widget v30 = verticalSpace(30);
  static final Widget v40 = verticalSpace(40);
  static final Widget v50 = verticalSpace(50);

  //Horizontal Spacing
  static final Widget h10 = horizontalSpace(10);
  static final Widget h20 = horizontalSpace(20);
  static final Widget h30 = horizontalSpace(30);
  static final Widget h40 = horizontalSpace(40);
  static final Widget h50 = horizontalSpace(50);
}
