import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

enum FlowType { spiral, leadStrength, spotStrength, }

class TipView extends StatelessWidget {
  final String description;
  final FlowType? flowType;
  final double height;
  const TipView(
      {super.key,
      required this.description,
      required this.height,
      this.flowType});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            clipBehavior: Clip.none, // ✅ allow image to overflow
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 310.w,
                height: height,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: CustomShadows.defaultShadow,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    color: Colors.lightBlueAccent.withOpacity(0.7),
                  ),
                ),
                child: Column(
                  children: [
                    80.h.verticalSpace,
                    Text(
                      'Tip!',
                      style: context.bodyMedium.copyWith(
                          color: Color(0xff2C2C2C),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    15.h.verticalSpace,
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        description,
                        style: context.bodyMedium.copyWith(
                            color: Color(0xff4C5157).withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp),
                      ),
                    ).paddingSymmetric(horizontal: 10.w),
                    15.h.verticalSpace,
                    CustomButton(
                      onPressed: () {
                        if (flowType == FlowType.spiral) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else if (flowType == FlowType.spotStrength) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else if (flowType == FlowType.leadStrength) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }},
                      buttonText: 'Done',
                      width: 161.w,
                      height: 48.h,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -70.h, // ✅ move image outside top of container
                child: Image.asset(
                  'assets/images/bulb-image.png',
                  width: 97.w,
                  height: 135.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
