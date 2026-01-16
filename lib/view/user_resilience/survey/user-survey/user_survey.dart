import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class UserSurvey extends StatelessWidget {
  UserSurvey({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: 'Survey',
        ),
        // body: const SingleChildScrollView(
        //   child: SurveyPreferencesCard(),
        // ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                isGradient: false,
                width: 200.w,
                text: "Skip",
                color: context.primary,
                fontcolor: context.onPrimary,
                fontWeight: FontWeight.w400,
                borderRadius: BorderRadius.circular(26.r),
                border: Border.all(
                  color: const Color(0xff0AB2AE),
                  width: 1,
                ),
              ).inkWell(onTap: () {
                // Navigate or skip logic
                Navigator.pushNamed(
                    context, RoutesName.surveyCompletionEmotions,
                    arguments: EmotionScreenMode.onboarding);
              }),
              16.w.horizontalSpace,
              CustomButton(
                width: 200.w,
                text: 'Continue',
              ).inkWell(
                  onTap: () => Navigator.pushNamed(
                      context, RoutesName.surveyCompletionEmotions,
                      arguments: EmotionScreenMode.onboarding))
            ],
          ),
        ),
      ),
    );
  }
}
