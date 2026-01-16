import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey5.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page5.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class Survey4 extends StatelessWidget {
  Survey4({super.key});
  final List<String> questions = [
    'I can break large problems into smaller, manageable steps.',
    'I think creatively when traditional solutions fail.',
    'I use logic to guide important decisions.',
    'I consider multiple perspectives before acting.',
    'I stay flexible when plans change.'

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey',),
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'PROBLEM SOLVING AND DECISION-MAKING',
          sectionDetail:
              'Ability to analyze, strategize, and take purposeful action',
          sectionCount: '4/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 4,// screen number
            totalSteps: 10,
          )),
      bottomNavigationBar:  Padding(
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
              ).inkWell(
                  onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Survey5())
                  ))
            ],
          ),
        ),
    );
  }
}
