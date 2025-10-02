import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/resources/app_assets.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class InviteBottomsheet extends StatelessWidget {
  final bool showSuggestions;
  final double? height;
  final double heightFactor;
  const InviteBottomsheet(
      {super.key,
      this.showSuggestions = true,
      this.height,
      this.heightFactor = 0.25});
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
                "Invite",
               style:AppTextStyle.heading()
              ),
              60.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _socialIcon(AppAssets.icon.whatsappIcon, "Whatsapp"),
                    _socialIcon(AppAssets.icon.facebookIcon, "Facebook"),
                    _socialIcon(AppAssets.icon.instaIcon, "Instagram"),
                    _socialIcon(AppAssets.icon.gmailIcon, "Gmail"),
                    _socialIcon(AppAssets.icon.snapchatIcon, "Snapchat"),
                  ],
                ),
              ),
              Container(
                width: 390.w,
                height: 1,
                color: const Color(0xffE0E7F0),
                margin: EdgeInsets.symmetric(vertical: 20.h),
              ),
            ],
          ),
        ),
        Positioned(
          top: -36.h,
          left: MediaQuery.of(context).size.width * 0.23,
          right: MediaQuery.of(context).size.width * 0.23,
          child: SvgPicture.asset(AppAssets.images.bottomSheet),
        ),
      ],
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        gradient: const RadialGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFE0E7F0)],
            center: Alignment.center,
            radius: 0.0),
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
}
