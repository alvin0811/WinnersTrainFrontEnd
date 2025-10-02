import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String logoPath;
  final String text;
  final String subtext;
  final bool showText;
  final String? titleText;
  final bool showBackButton;
  final VoidCallback? onPressed;

  const CustomAuthAppBar({
    Key? key,
    required this.appBarHeight,
    required this.logoPath,
    this.text = '',
    this.subtext = '',
    this.showText = true,
    this.titleText = '',
    this.showBackButton = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/authbg.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.r),
              bottomRight: Radius.circular(50.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              60.verticalSpace,
              Image.asset(
                logoPath,
                width: 203.w,
                height: 165.h,
                fit: BoxFit.contain,
              ),
              if (showText)
                Text(
                  text,
                  style: TextStyle(
                    color: const Color(0xffFFFFFF),
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              10.verticalSpace,
              if (showText)
                Opacity(
                  opacity: 0.9,
                  child: Text(subtext,
                      style: AppTextStyle.button(
                          fontWeight: FontWeight.w300, color: Colors.white)),
                ),

              if (showText)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    width: 90.w,
                    height: 3.h,
                    color: Colors.white,
                  ),
                ),
              // 10.verticalSpace,
            ],
          ),
        ),
        leading: showBackButton
            ? GestureDetector(
                onTap: onPressed,
                child: Image.asset(
                  "assets/images/back.png",
                  width: 40.w,
                  height: 40.h,
                  fit: BoxFit.cover,
                ),
              )
            : null,
        title: titleText != null && titleText!.isNotEmpty
            ? Text(titleText!,
                style: AppTextStyle.button(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                ))
            : null,
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 401.h);
}
