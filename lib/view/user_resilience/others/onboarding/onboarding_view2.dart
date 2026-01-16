import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

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
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          width: 40.w,
                          height: 40.h,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                      "assets/images/problem.png",
                      fit: BoxFit.cover,
                      width: 388.w,
                      height: 288.h,
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
                    'Daily Reflection Practice',
                    style: context.titleLarge.copyWith(
                        color: Color(0xff121314),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                20.h.verticalSpace,
                Text(
                  textAlign: TextAlign.justify,
                  'Each day, you’ll receive a Thought of the Day to guide your reflection. Begin by reading the quote slowly, allowing its message to sink in. Then, think about how it relates specifically to you — not to anyone else. Ask yourself whether it aligns with your current emotions and mindset, and what truth it reveals about your inner thoughts today. After reflecting, record a short note or sentence describing how this thought applies to your day or behavior. Remember, the goal is to focus on your personal insight — real growth happens when you look inward, not sideways.',
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
                    Expanded(
                      child: CustomButton(
                       // width: 207.w,
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
                    ),
                    15.w.horizontalSpace,
                    Expanded(
                      child: CustomButton(
                       // width: 207.w,
                        fontsize: 14.sp,
                        height: 50.h,
                        text: 'Continue',
                      ).inkWell(onTap: () {
                        G().howitWorks = HowitWorks.onBoarding;
                        Navigator.pushNamed(context, RoutesName.howitWorks);
                      }),
                    )
                  ],
                ),
                40.h.verticalSpace
              ],
            ).paddingSymmetric(horizontal: 20.w)));
  }
}
