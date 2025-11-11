import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 410.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffD8ECF0),
                  border: Border.all(color: Color(0xff0AB2AE).withOpacity(0.2)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r)),
                ),
                child: Column(
                  children: [
                    AppBar(
                      centerTitle: true,
                      title: Text(
                        'Onboarding',
                        style: context.bodyMedium.copyWith(
                            color: Color(0xff121314),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    10.h.verticalSpace,
                    Image.asset(
                      "assets/images/loop.png",
                      fit: BoxFit.cover,
                      width: 378.w,
                      height: 318.h,
                    )
                  ],
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.h.verticalSpace,
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Welcome to your Resiliency Training \n& Coaching Journey.',
                    style: context.titleLarge.copyWith(
                        color: Color(0xff121314),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                20.h.verticalSpace,
                
                Text(
                  textAlign: TextAlign.center,
                  'This program helps you strengthen your ability to adapt, recover, and grow through life’s challenges.',
                  style: context.bodyMedium.copyWith(
                      letterSpacing: 1.5,
                      color: Color(0xff4C5157).withOpacity(0.7),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300),
                ),
                5.h.verticalSpace,
                Text(
                  textAlign: TextAlign.center,
                  'Every step you take — no matter how small — builds your foundation of resilience.',
                  style: context.bodyMedium.copyWith(
                      letterSpacing: 1.5,
                      color: Color(0xff4C5157).withOpacity(0.7),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300),
                ),
                5.h.verticalSpace,
                Text(
                  textAlign: TextAlign.center,
                  'Progress begins with self-awareness, consistency, and celebrating every small win. ',
                  style: context.bodyMedium.copyWith(
                      letterSpacing: 1.5,
                      color: Color(0xff4C5157).withOpacity(0.7),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300),
                ),
                5.h.verticalSpace,
                Text(
                  textAlign: TextAlign.center,
                  'Take a few minutes to review the “about the app” disclaimer.',
                  style: context.bodyMedium.copyWith(
                      letterSpacing: 1.5,
                      color: Color(0xff4C5157).withOpacity(0.7),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300),
                ),
               Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: 207.w,
                      height: 50.h,
                      border: CustomBorder.thin(
                        color: Color(0xff0AB2AE),
                      ),
                      isGradient: false,
                      text: 'Skip',
                      fontsize: 14.sp,
                      fontcolor: context.onPrimary,
                      color: context.primary,
                      fontWeight: FontWeight.w500,
                    ).inkWell(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context, RoutesName.selectUser, (r) => false)),
                    15.w.horizontalSpace,
                    CustomButton(
                      width: 207.w,
                      fontsize: 14.sp,
                      height: 50.h,
                      text: 'Continue',
                    ).inkWell(onTap: () {
                      Navigator.pushNamed(context, RoutesName.onboarding2);
                    })
                  ],
                ),
                40.h.verticalSpace
              ],
            ).paddingSymmetric(horizontal: 20.w)));
  }
}
