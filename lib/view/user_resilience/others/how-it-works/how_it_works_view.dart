import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class HowItWorksView extends StatelessWidget {
  const HowItWorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(
        title: 'How It Works',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            width: double.infinity,
            height: G().howitWorks == HowitWorks.onBoarding ? 730.h : 788.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: CustomShadows.defaultShadow,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 1: Character Survey',
                    style: context.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w600),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Understand Your Foundation',
                    style: context.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w600),
                  ),
                  10.h.verticalSpace,
                  const BulletPoint(
                      "You'll receive your Character Type; a snapshot of your current strengths, challenges, and habits."),
                  10.h.verticalSpace,
                  Text(
                    '2. Review your results — this is your starting point for growth',
                    style: context.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w600),
                  ),
                  10.h.verticalSpace,
                  Text(
                    '3. Retake the survey every 90 days to gauge your refinement and progress.',
                    style: context.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w600),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Your feedback and coaching tips will be customized based on your character type and your daily challenges and successes.',
                    style: context.bodySmall.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w300),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Step 2: Self-Credit & Trait Refinement',
                    style: context.bodyMedium.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w600),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Celebrate Growth — Big or Small',
                    style: context.bodySmall.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w300),
                  ),
                  10.h.verticalSpace,
                  const BulletPoint(
                      "Give yourself credit daily. Growth takes courage."),
                  10.h.verticalSpace,
                  const BulletPoint(
                      "Compare yourself to no one. Your only competition is yesterday’s version of you."),
                  10.h.verticalSpace,
                  const BulletPoint(
                      "Each week, choose one trait to refine — such as patience, confidence, or focus."),
                  10.h.verticalSpace,
                  const BulletPoint(
                      "Commit to one small action daily that strengthens that trait."),
                  10.h.verticalSpace,
                  Text(
                    'Example:',
                    style: context.bodySmall.copyWith(
                        fontSize: 16.sp,
                        color: Color(0xff4C5157),
                        fontWeight: FontWeight.w600),
                  ),
                  10.h.verticalSpace,
                  BulletPoint(
                      stepCount: Text('Trait:',
                              style: context.bodySmall.copyWith(
                                  fontSize: 16.sp,
                                  color: Color(0xff4C5157),
                                  fontWeight: FontWeight.w600))
                          .paddingOnly(right: 4.w),
                      "Confidence"),
                  10.h.verticalSpace,
                  BulletPoint(
                      stepCount: Text('Daily Action:',
                              style: context.bodySmall.copyWith(
                                  fontSize: 16.sp,
                                  color: Color(0xff4C5157),
                                  fontWeight: FontWeight.w600))
                          .paddingOnly(right: 4.w),
                      "Speak Up once in a group "),
                 
                    Text(
                    'discussion.',
                     style: context.bodySmall.copyWith(
                fontSize: 16.sp,
                color: Color(0xff4C5157),
                fontWeight: FontWeight.w300),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Step 3: Track Your Progress',
                    style: context.bodyMedium.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Visualize Your Growth',
                    style: context.bodyMedium.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'The app allows you to track:',
                    style: context.bodySmall.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  10.h.verticalSpace,
                  const BulletPoint("Your daily reflections"),
                  10.h.verticalSpace,
                  const BulletPoint("Your 90-day character growth chart"),
                  10.h.verticalSpace,
                  const BulletPoint("Your weekly trait focus"),
                  10.h.verticalSpace,
                  Text(
                    'Use this visual progress as motivation. It’s not about perfection — it’s about persistence.',
                    style: context.bodySmall.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  20.h.verticalSpace,
                  Text(
                    'Optional Features',
                    style: context.bodyMedium.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.h.verticalSpace,
                  const BulletPoint(
                    "Weekly Coaching Insights — Personalized tips based on your reflections and survey",
                  ),
                  10.h.verticalSpace,
                  const BulletPoint(
                    "Goal Reminders — Gentle notifications to keep you on track.",
                  ),
                  10.h.verticalSpace,
                  const BulletPoint(
                    "Positive Affirmations Feed — Aligned with your evolving character traits",
                  ),
                  10.h.verticalSpace,
                  const BulletPoint(
                    "Reflection Journal — A safe space to capture thoughts, emotions, and lessons.",
                  ),
                  20.h.verticalSpace,
                  Text(
                    'Closing Encouragement',
                    style: context.bodyMedium.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Resilience isn’t built overnight — it’s built through daily awareness, honest reflection, and steady effort.',
                    style: context.bodySmall.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Each moment you invest in understanding yourself makes you stronger, calmer, and more capable of navigating life’s challenges.',
                    style: context.bodySmall.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    'Keep showing up. Keep growing. Keep refining your best self.',
                    style: context.bodySmall.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  10.h.verticalSpace,
                  Text(
                    '*Just Win!!!*',
                    style: context.bodyMedium.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff4C5157),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w),
      bottomNavigationBar: G().howitWorks == HowitWorks.onBoarding
          ? Row(
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
                  Navigator.pushNamed(context, RoutesName.selectUser);
                })
              ],
            ).paddingOnly(
              right: 20.w,
              left: 20.w,
              bottom: 40.h,
            )
          : null,
    ));
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  final Widget? stepCount;
  const BulletPoint(this.text, {super.key, this.stepCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        stepCount ??
            Container(
              margin: EdgeInsets.only(
                  top: 8, right: 8.w), // aligns the bullet vertically
              height: 8.h,
              width: 8.w,
              decoration: const BoxDecoration(
                color: Color(0xff4C5157),
                shape: BoxShape.circle,
              ),
            ),
        //  SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: context.bodySmall.copyWith(
                fontSize: 16.sp,
                color: Color(0xff4C5157),
                fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
