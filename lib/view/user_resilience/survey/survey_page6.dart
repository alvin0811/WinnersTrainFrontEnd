import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page7.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage6 extends StatelessWidget {
  SurveyPage6({super.key});
  final List<String> questions = [
    'I can reach out for help when I need it.',
    'I have people I trust to discuss personal challenges with.',
    'I make an effort to stay connected with others.',
    'I offer emotional support to friends or colleagues in distress.',
    'I value collaboration over competition.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey',),
      body: SurveyPreferencesCard(
          questions: questions,
          sections: 'SOCIAL SUPPORT AND CONNECTION',
          sectionDetail:
              'Ability to both give and receive support under stress',
          sectionCount: '6/10',
          surveyProgressWidget: const SurveyProgressBar(
            currentStep: 6,// screen number
            totalSteps: 10,
          )),
      bottomNavigationBar: const CustomButton(
        text: 'Please Answer all to Continue',
      )
          .inkWell(
              onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> SurveyPage7())
                  ))
          .paddingSymmetric(vertical: 25.h, horizontal: 20.w),
    );
  }
}
