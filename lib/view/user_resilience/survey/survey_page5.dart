import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page6.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage5 extends StatelessWidget {
  SurveyPage5({super.key});
  final List<String> questions = [
    'I remain productive when routines are disrupted.',
    'I am comfortable learning new ways of doing things',
    'I stay engaged during organizational or life changes.',
    'I easily adjust my goals when priorities shift.',
    'I can manage uncertainty without losing motivation.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey',),
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'ADAPTABILITY',
          sectionDetail:
              'Capacity to adjust to change and manage uncertainty',
          sectionCount: '5/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 5,// screen number
            totalSteps: 10,
          )),
      bottomNavigationBar: const CustomButton(
        text: 'Please Answer all to Continue',
      )
          .inkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> SurveyPage6())
                  ))
          .paddingSymmetric(vertical: 25.h, horizontal: 20.w),
    );
  }
}
