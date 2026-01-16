import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';

class SurveyPage1 extends StatelessWidget {
  SurveyPage1({super.key});
  final List<String> questions = [
    'I can stay calm under pressure.',
    'I can take a deep breath and refocus when upset.',
    'I rarely let emotions control my decisions.',
    'I can find ways to relax after a stressful event.',
    'I can recover quickly after emotional setbacks.'
  ];
  @override
  Widget build(BuildContext context) {
    return SurveyPreferencesCard(
        questions: questions,
        sections: 'EMOTIONAL REGULATION',
        sectionDetail:
            'Ability to manage stress, frustration, or negative emotions effectively.',
        sectionCount: '1/10',
        surveyProgressWidget: const SurveyProgressBar(
          currentStep: 1, // screen number
          totalSteps: 10,
        ));
  }
}
