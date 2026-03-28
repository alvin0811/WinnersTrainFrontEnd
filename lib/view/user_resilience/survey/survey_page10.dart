import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_preferences_card.dart';
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
        bottomNavigationBar: G().emotionScreenMode == EmotionScreenMode.fromHome
            ? const CustomButton(
                text: 'Please Answer all to Continue',
              )
                .inkWell(
                    onTap: () => Navigator.pushNamed(
                          context,
                          RoutesName.surveyCompletionEmotions,
                          arguments: EmotionScreenMode.fromHome
                        ))
                .paddingOnly(top: 10.h, bottom: 25.h, right: 20.w, left: 20.w)
            : G().emotionScreenMode == EmotionScreenMode.onboarding
                ? Padding(
                    padding: EdgeInsets.only(
                        top: 10.h, bottom: 25.h, right: 20.w, left: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                            isGradient: false,
                            //  width: 200.w,
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
                        ),
                        14.w.horizontalSpace,
                        Expanded(
                          child: const CustomButton(
                            // width: 200.w,
                            text: 'Continue',
                          ).inkWell(
                              onTap: () => Navigator.pushNamed(
                                    context,
                                    RoutesName.surveyCompletionEmotions,
                                    arguments: EmotionScreenMode.onboarding
                                  )),
                        )
                      ],
                    ),
                  )
                : null,
    );
  }
}
