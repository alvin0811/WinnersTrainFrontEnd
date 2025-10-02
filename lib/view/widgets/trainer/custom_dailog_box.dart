import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String? iconPath;
  final String buttonText;
  final String secondaryButtonText;
  final VoidCallback? onPressed;
  final VoidCallback? onPressed1;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.description,
    this.iconPath,
    required this.buttonText,
    required this.secondaryButtonText,
    this.onPressed,
    this.onPressed1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 25,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconPath != null)
              SvgPicture.asset(
                iconPath!,
                height: 80.h,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
              ),
            if (iconPath != null) SizedBox(height: 20.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff121314),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyle.button(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (onPressed1 != null) {
                      onPressed1!();
                    }
                  },
                  child: Container(
                    width: 147.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.r),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xff0AB2AE)),
                    ),
                    child: Center(
                      child: Text(
                        secondaryButtonText,
                        style: AppTextStyle.button(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                15.w.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    if (onPressed != null) {
                      onPressed!();
                    }
                  },
                  child: Container(
                    width: 147.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.r),
                        gradient: LinearGradient(
                            colors: [Color(0xff4C5157), Color(0xff121314)])),
                    child: Center(
                      child: Text(
                        buttonText,
                         style: AppTextStyle.button(
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String description,
  String? iconPath,
  required String buttonText,
  required String secondaryButtonText,
  VoidCallback? onPressed,
  VoidCallback? onPressed1,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.backgroundColor.withOpacity(0.8),
    builder: (_) => CustomDialog(
      title: title,
      description: description,
      iconPath: iconPath,
      buttonText: buttonText,
      secondaryButtonText: secondaryButtonText,
      onPressed: onPressed ?? () {},
      onPressed1: onPressed1 ?? () {},
    ),
  );
}
