import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 80.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SurveyPreferencesCard(),
                  ],
                ),
              ),
            ),

            // Fixed button at the bottom of the screen
            // Positioned(
            //     bottom: 125.h,
            //     left: 16.w,
            //     right: 16.w,
            //     child: const CustomButton(
            //       text: 'Please Answer all to Continue',
            //     ).inkWell(
            //         onTap: () => Navigator.pushNamed(
            //               context,
            //               RoutesName.surveyCompletionEmotions,
            //               arguments: EmotionScreenMode.fromHome,
            //             ))),
          ],
        ),
      ),
    );
  }
}
