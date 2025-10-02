import 'package:flutter_svg/svg.dart';

import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class CustomAppPermissions extends StatelessWidget {
  final String? titletext;
  final String bodyText;
  final Widget? icon;
  final String? buttonText;
  final Widget? optionalButton;
  final Widget? button;
  final VoidCallback onTap;
  const CustomAppPermissions({
    super.key,
    this.titletext,
    this.icon,
    required this.buttonText,
    required this.bodyText,
    required this.onTap,
    this.optionalButton,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: icon ??
                      SvgPicture.asset(AppAssets.icon.likeIcon,
                          width: 100.w, height: 100.h)),
              10.h.verticalSpace,
              Center(
                child: Text(
                  titletext ?? 'Thank You!',
                  style: context.headlineSmall.copyWith(
                    fontSize: 22.sp,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                  child: Text(
                bodyText,
                textAlign: TextAlign.center,
                style: context.titleMedium,
              )),
              SizedBox(height: 20.h),
              button ??
                  Center(
                      child: CustomButton(
                    width: 161.w,
                    height: 48.h,
                    text: buttonText,
                    isGradient: true,
                    gradient: const LinearGradient(
                      begin: Alignment(0.97, -0.26),
                      end: Alignment(-0.97, 0.26),
                      colors: [
                        Color(0xff121314),
                        Color(0xff4C5157),
                      ],
                    ),
                  ).inkWell(onTap: onTap)),
              20.h.verticalSpace,
              if (optionalButton != null) optionalButton!
            ],
          )),
    );
  }
}
