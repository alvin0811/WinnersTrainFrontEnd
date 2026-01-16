import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage10 extends StatelessWidget {
  SurveyPage10({super.key});
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
      appBar: CustomAppBar(title: 'Survey',),
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'SELF-CARE AND RECOVERY',
          sectionDetail:
              'Ability to recharge, rest, and sustain wellbeing',
          sectionCount: '10/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 10,// screen number
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
          .paddingSymmetric(vertical: 25.h, horizontal: 20.w),
    );
  }
}
