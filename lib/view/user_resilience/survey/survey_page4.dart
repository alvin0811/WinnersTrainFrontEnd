import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page5.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage4 extends StatelessWidget {
  SurveyPage4({super.key});
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
      bottomNavigationBar: const CustomButton(
        text: 'Please Answer all to Continue',
      )
          .inkWell(
              onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> SurveyPage5())
                  ))
          .paddingSymmetric(vertical: 25.h, horizontal: 20.w),
    );
  }
}
