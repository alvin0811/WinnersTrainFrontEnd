import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page10.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage9 extends StatelessWidget {
  SurveyPage9({super.key});
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
      bottomNavigationBar: const CustomButton(
        text: 'Please Answer all to Continue',
      )
          .inkWell(
              onTap: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> SurveyPage10())
                  ))
          .paddingSymmetric(vertical: 25.h, horizontal: 20.w),
    );
  }
}
