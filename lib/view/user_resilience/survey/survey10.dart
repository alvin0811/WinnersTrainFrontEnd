import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class Survey10 extends StatelessWidget {
  Survey10({super.key});
  final List<String> questions = [
    'I know when to take breaks and reset.',
    'I maintain a healthy diet, sleep, and exercise routine.',
    'I do activities that bring me joy and calm.',
    'I protect time for rest even when busy.',
    'I practice habits that support both mental and physical energy.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Survey',
        ),
        body: SurveyPreferencesCard(
            questions: questions,
            sections: 'SELF-CARE AND RECOVERY',
            sectionDetail: 'Ability to recharge, rest, and sustain wellbeing',
            sectionCount: '10/10',
            surveyProgressWidget: const SurveyProgressBar(
              currentStep: 10, // screen number
              totalSteps: 10,
            )),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
            child: Row(
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
                      context, RoutesName.surveyCompletionEmotions,
                      arguments: EmotionScreenMode.onboarding);
                }),
                16.w.horizontalSpace,
                CustomButton(
                  width: 200.w,
                  text: 'Continue',
                ).inkWell(onTap: () {
                  // Navigate or skip logic
                  Navigator.pushNamed(
                      context, RoutesName.surveyCompletionEmotions,
                      arguments: EmotionScreenMode.onboarding);
                }),
              ],
            )));
  }
}
