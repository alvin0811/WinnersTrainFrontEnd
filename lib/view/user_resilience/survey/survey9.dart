import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey10.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page10.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class Survey9 extends StatelessWidget {
  Survey9({super.key});
  final List<String> questions = [
    'I persist even when progress is slow.',
    'I can handle routine and repetition while staying focused.',
    'I stay motivated after multiple failures.',
    'I set realistic milestones toward big goals.',
    'I rarely abandon something just because it’s hard.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey',),
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'GRIT AND PERSEVERANCE',
          sectionDetail:
              'Capacity to sustain effort toward long-term goals.',
          sectionCount: '9/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 9,// screen number
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
              ).inkWell(
                  onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Survey10())
                  ))
            ],
          ),
        ),
    );
  }
}
