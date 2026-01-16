import 'package:flutter/widgets.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey4.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page4.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
class Survey3 extends StatelessWidget {
   Survey3({super.key});
  final List<String> questions = [
    'I can find something positive in difficult situations',
    'I believe setbacks make me stronger.',
    'I can laugh even when things don’t go as planned.',
    'I feel hopeful about the future.',
    'I quickly shift my focus from what went wrong to what I can do next.'
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: 'Survey',),
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'OPTIMISM AND POSITIVE OUTLOOK',
          sectionDetail:
              'Expectation that things will work out or that setbacks are temporary',
          sectionCount: '3/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 3,// screen number
            totalSteps: 10,
          )),
      bottomNavigationBar:Padding(
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
                    MaterialPageRoute(builder: (context)=> Survey4())
                  ))
            ],
          ),
        ),
    );
  }
}