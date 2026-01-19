import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_border_radius.dart';

import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';


class SurveyCompletionEmotions extends StatefulWidget {
  final EmotionScreenMode mode;

  const SurveyCompletionEmotions({super.key, required this.mode});

  @override
  State<SurveyCompletionEmotions> createState() =>
      _SurveyCompletionEmotionsState();
}

class _SurveyCompletionEmotionsState extends State<SurveyCompletionEmotions> {
  final ValueNotifier<int?> selectedIndex = ValueNotifier<int?>(null);

  final List<Map<String, String>> emotions = [
    {"icon": AppAssets.icon.sadIcon, "text": "I'm feeling sad"},
    {"icon": AppAssets.icon.stressedIcon, "text": "I'm feeling stressed"},
    {"icon": AppAssets.icon.frustratedIcon, "text": "I'm feeling frustrated"},
    {"icon": AppAssets.icon.angryIcon, "text": "I'm feeling angry"},
    {"icon": AppAssets.icon.happyIcon, "text": "I'm feeling happy"},
  ];

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: widget.mode == EmotionScreenMode.fromCompetencies
            ? CustomAppBar(
                title: 'Self Check-In',
              )
            : null,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               if (widget.mode == EmotionScreenMode.fromCompetencies)...[
                20.h.verticalSpace,
               ] else...[ 267.h.verticalSpace,],
            Center(
              child: Text(
                'How do you feel right now?',
                style: context.headlineSmall.copyWith(
                  color: const Color(0xff0F0E0F),
                ),
              ),
            ),
            11.h.verticalSpace,
            if (widget.mode == EmotionScreenMode.onboarding ||
                widget.mode == EmotionScreenMode.fromHome) ...[
              Center(
                child: Text(
                  'After filling survey form?',
                  style: context.titleLarge.copyWith(
                    color: context.onSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ] else ...[
              SizedBox.shrink()
            ],
            40.h.verticalSpace,
            ValueListenableBuilder<int?>(
              valueListenable: selectedIndex,
              builder: (context, selectedIdx, _) {
                return Column(
                  children: [
                    /// First row with 3 items
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return _buildEmotionCard(index, selectedIdx);
                      }),
                    ),

                    16.h.verticalSpace, // Spacing between rows

                    /// Second row with last 2 items centered
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: _buildEmotionCard(index + 3, selectedIdx),
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),

            /// Conditional buttons
            if (widget.mode == EmotionScreenMode.onboarding) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    isGradient: false,
                    width: 200.w,
                    text: "Skip",
                    color: context.primary,
                    fontcolor: context.onPrimary,
                    fontWeight: FontWeight.w400,
                    borderRadius: BorderRadius.circular(26.r),
                    border: Border.all(
                      color: const Color(0xff0AB2AE),
                      width: 1,
                    ),
                  ).inkWell(onTap: () {
                    // Navigate or skip logic
                    Navigator.pushNamed(
                        context, RoutesName.successAccountCreation);
                  }),
                  //16.w.horizontalSpace,
                  CustomButton(
                    width: 200.w,
                    text: 'Continue',
                  ).inkWell(
                      onTap: () => Navigator.pushNamed(
                          context, RoutesName.successAccountCreation)),
                ],
              ),
            ] else if(widget.mode == EmotionScreenMode.fromHome) ...[
              Center(
                child: CustomButton(
                  width: 258.w,
                  text: 'Continue',
                ).inkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesName.successPersonalSurvey);
                  },
                ),
              ),
            ] else...[
                Center(
                child: CustomButton(
                  width: 258.w,
                  text: 'Next',
                ).inkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesName.targetFocus);
                  },
                ),
              ),
            ],
            40.h.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }

  /// Helper function to build each emotion card
  Widget _buildEmotionCard(int index, int? selectedIdx) {
    bool isSelected = selectedIdx == index;

    return GestureDetector(
      onTap: () => selectedIndex.value = index,
      child: Container(
        // duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        width: 121.w,
        height: 133.h,
        margin: EdgeInsets.only(left: 5, right: 4),
        decoration: BoxDecoration(
          borderRadius: CustomBorderRadius.medium,
          color: isSelected ? null : context.primary,
          gradient: isSelected ? AppColor.secondaryButton : null,
          border: CustomBorder.dynamicBorder(
            width: isSelected ? 2 : 1,
            color: isSelected ? context.primary : const Color(0xffB3BDCC),
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 15.r,
                offset: const Offset(0, 6),
              )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              emotions[index]["icon"]!,
              color: isSelected
                  ? context.primary
                  : context.onPrimary.withOpacity(0.75),
              width: 42.16.w,
              height: 42.16.h,
            ),
            8.h.verticalSpace,
            Text(
              emotions[index]["text"]!,
              textAlign: TextAlign.center,
              style: context.titleMedium.copyWith(
                color: isSelected ? context.primary : context.onSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
