import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class OnboardingSurvey extends StatelessWidget {
  OnboardingSurvey({super.key});
  final List<String> questions = [
    'I can stay calm under pressure.',
    'I can take a deep breath and refocus when upset.',
    'I rarely let emotions control my decisions.',
    'I can find ways to relax after a stressful event.',
    'I can recover quickly after emotional setbacks.'
  ];
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: 'Survey',
        ),
        body: SingleChildScrollView(
            child: SurveyPreferencesCard(
                questions: questions,
                sections: 'EMOTIONAL REGULATION',
                sectionDetail:
                    'Ability to manage stress, frustration, or negative emotions effectively.',
                sectionCount: '1/10',
                surveyProgressWidget: const SurveyProgressBar(
                  currentStep: 1, // screen number
                  totalSteps: 10,
                ))),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(top: 10.h, bottom: 25.h, right: 20.w, left: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  isGradient: false,
                  //  width: 200.w,
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
                  G().emotionScreenMode = EmotionScreenMode.onboarding;
                  Navigator.pushNamed(
                    context,
                    RoutesName.surveyCompletionEmotions,
                  );
                }),
              ),
              14.w.horizontalSpace,
              Expanded(
                child: const CustomButton(
                  // width: 200.w,
                  text: 'Continue',
                ).inkWell(onTap: () {
                  G().emotionScreenMode = EmotionScreenMode.onboarding;
                  Navigator.pushNamed(
                    context,
                    RoutesName.surveyPage2,
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//  // Navigate or skip logic
//                 Navigator.pushNamed(
//                     context, RoutesName.surveyCompletionEmotions,
//                     arguments: EmotionScreenMode.onboarding);
