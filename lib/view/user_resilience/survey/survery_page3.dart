import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page4.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage3 extends StatelessWidget {
  SurveyPage3({super.key});
  final List<String> questions = [
    'I can find something positive in difficult situations',
    'I believe setbacks make me stronger.',
    'I can laugh even when things don’t go as planned.',
    'I feel hopeful about the future.',
    'I quickly shift my focus from what went wrong to what I can do next.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: const CustomButton(
        text: 'Please Answer all to Continue',
      )
          .inkWell(
              onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> SurveyPage4())
                  ))
          .paddingSymmetric(vertical: 25.h, horizontal: 20.w),
    );
  }
}
