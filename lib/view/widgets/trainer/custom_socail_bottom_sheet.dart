import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class SocialMediaBottomSheet extends StatelessWidget {
  final bool showSuggestions;
  final double? height;
  final double heightFactor;

  const SocialMediaBottomSheet({
    super.key,
    this.showSuggestions = true,
    this.height,
    this.heightFactor = 0.40,
  });

  @override
  Widget build(BuildContext context) {
    final sheetContent = Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              10.verticalSpace,
              Text(
                "Share",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                ),
              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _socialIcon("assets/images/Whatsapp.png", "Whatsapp"),
                    _socialIcon("assets/images/Facebook.png", "Facebook"),
                    _socialIcon("assets/images/Instagram.png", "Instagram"),
                    _socialIcon("assets/images/Gmail.png", "Gmail"),
                    _socialIcon("assets/images/Snapchat.png", "Snapchat"),
                  ],
                ),
              ),
              if (showSuggestions) ...[
                Container(
                  width: 370.w,
                  height: 1,
                  color: const Color(0xffE0E7F0),
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _socialProfileImg(
                          "assets/images/Ellipse 61.png", 'Stress-Related'),
                      _socialProfileImg(
                          "assets/images/Ellipse 61.png", 'Stress-Related'),
                      _socialProfileImg(
                          "assets/images/Ellipse 61.png", 'Stress-Related'),
                      SizedBox(width: 60.w),
                    ],
                  ),
                ),
                10.verticalSpace,
              ]
            ],
          ),
        ),
        Positioned(
          top: -35.h,
          left: MediaQuery.of(context).size.width * 0.23,
          right: MediaQuery.of(context).size.width * 0.23,
          child: SvgPicture.asset("assets/svg/Group 15364.svg"),
        ),
      ],
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        gradient: AppColors.bottomsheetGradient,
      ),
      child: height != null
          ? SizedBox(height: height, child: sheetContent)
          : FractionallySizedBox(
              heightFactor: heightFactor, child: sheetContent),
    );
  }

  Widget _socialIcon(String asset, String label) {
    return Column(
      children: [
        Image.asset(asset, width: 40.w, height: 40.h, fit: BoxFit.contain),
        10.verticalSpace,
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xff121314),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _socialProfileImg(String asset, String label) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffD5D1D2), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Color(0x14223850),
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipOval(child: Image.asset(asset, fit: BoxFit.cover)),
        ),
        10.verticalSpace,
        SizedBox(
          width: 78.w,
          child: Text(
            label,
            style: AppTextStyle.small(
              color: const Color(0xff121314),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
