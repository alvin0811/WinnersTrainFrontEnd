import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage2 extends StatelessWidget {
  SurveyPage2({super.key});
  final List<String> questions = [
    'I trust my ability to solve unexpected problems.',
    'I usually find a way to achieve my goals even when things get tough.',
    'I can adapt my plan if something doesn’t work out.',
    'I feel confident when taking on something new.',
    '5.	I rarely feel helpless in challenging situations.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'SELF-EFFICACY',
          sectionDetail:
              'Belief in one’s ability to handle challenges successfully',
          sectionCount: '2/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 2, // screen number
            totalSteps: 10,
          )),
      bottomNavigationBar: const CustomButton(
        text: 'Please Answer all to Continue',
      )
          .inkWell(
              onTap: () => Navigator.pushNamed(
                    context,
                    RoutesName.surveyCompletionEmotions,
                    arguments: EmotionScreenMode.fromHome,
                  ))
          .paddingSymmetric(vertical: 10.h),
    );
  }
}
