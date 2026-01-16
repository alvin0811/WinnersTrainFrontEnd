import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page8.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage7 extends StatelessWidget {
  SurveyPage7({super.key});
  final List<String> questions = [
    'I can recognize when my thoughts are becoming negative.',
    'I take time to reflect on how events affect me.',
    'I know what situations challenge me most.',
    'I can identify my early signs of stress.',
    'I take responsibility for my reactions.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey',),
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'SELF-AWARENESS AND REFLECTION',
          sectionDetail:
              'Understanding one’s values, triggers, and motivations',
          sectionCount: '7/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 7,// screen number
            totalSteps: 10,
          )),
      bottomNavigationBar: const CustomButton(
        text: 'Please Answer all to Continue',
      )
          .inkWell(
              onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> SurveyPage8())
                  ))
          .paddingSymmetric(vertical: 25.h, horizontal: 20.w),
    );
  }
}
