import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget bodyContent;
  final Widget? footerContent;
  final double? width;
  final double? height;
  final double? heightFactor;

  const CustomBottomSheet({
    Key? key,
    required this.title,
    required this.bodyContent,
    this.footerContent,
    this.width,
    this.heightFactor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: heightFactor ?? 0.45,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            // width: width ?? double.infinity,
            // height: height ?? 220.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              gradient: const RadialGradient(
                  colors: [Color(0xFFFFFFFF), Color(0xFFE0E7F0)],
                  center: Alignment.center,
                  radius: 0.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              border: CustomBorder.thin(color: Color(0xff96A0B9)),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xff0000004D),
                    blurRadius: 15,
                    offset: Offset(3, 0)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Text(title,
                    style: AppTextStyle.button(fontWeight: FontWeight.bold)),
                SizedBox(height: 10.h),
                Expanded(child: bodyContent),
                if (footerContent != null) footerContent!,
              ],
            ),
          ),
          Positioned(
            top: -42.h,
            left: MediaQuery.of(context).size.width * 0.23,
            right: MediaQuery.of(context).size.width * 0.23,
            child: SvgPicture.asset(
              AppAssets.images.bottomSheet,
              height: 50.h,
            ),
          ),
        ],
      ),
    );
  }
}
