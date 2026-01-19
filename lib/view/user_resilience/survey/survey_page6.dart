import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_preferences_card.dart';
import 'package:winner_trains_app/view/user_resilience/survey/widgets/survey_progress_indicator.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
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
    return CustomBackground(
      child: Scaffold(
         backgroundColor: Colors.transparent,
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
         bottomNavigationBar: G().emotionScreenMode == EmotionScreenMode.fromHome
            ? const CustomButton(
                text: 'Please Answer all to Continue',
              )
                .inkWell(
                    onTap: () => Navigator.pushNamed(
                          context,
                          RoutesName.surveyPage7,
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
                                    RoutesName.surveyPage7,
                                  )),
                        )
                      ],
                    ),
                  )
                : null,
      ),
    );
  }
}
