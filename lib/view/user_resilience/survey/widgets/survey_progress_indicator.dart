import 'package:winner_trains_app/utils/basic_exports.dart';

class SurveyProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const SurveyProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentStep / totalSteps;

    return LayoutBuilder(
      builder: (context, constraints) {
        final barWidth = constraints.maxWidth;
        final indicatorX = barWidth * progress;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Background bar
                Container(
                  height: 10.h,
                  width: barWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffEAEAEA),
                  ),
                ),

                // Filled progress
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10.h,
                  width: barWidth * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xff6AD6C3), Color(0xff00BFA6)],
                    ),
                  ),
                ),

                // // Arrow indicator
                // Positioned(
                //   left: indicatorX - 17.w,
                //   top: 20.h,
                //   child: Column(
                //     children: [
                //       Image.asset(
                //         AppAssets.icon.surveyArrowIcon,
                //         width: 11.w,
                //         height: 17.h,
                //       ),
                //       2.h.verticalSpace,
                //       Text(
                //         '${(progress * 100).round()}%',
                //         style: context.labelMedium.copyWith(
                //           fontSize: 12.sp,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        );
      },
    );
  }
}
