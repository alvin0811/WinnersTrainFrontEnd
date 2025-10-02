import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/model/competencies_model.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class CompetenciesDetailsView extends StatelessWidget {
  final CompetenciesModel competency;
  final int index; // 👈 new field
  const CompetenciesDetailsView(
      {super.key, required this.competency, required this.index});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            10.h.verticalSpace,
            // 👇 Conditional container
            if (index == 6 || index == 9)
              Transform.scale(
                scale: 1.07,
                child: Image.asset(
                  competency.icon,
                  fit: BoxFit.cover,
                ),
              )
            else
              Container(
                height: 398.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: CustomShadows.defaultShadow,
                  color: Colors.lightBlueAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: Colors.lightBlueAccent.withOpacity(0.3),
                  ),
                ),
                child: Image.asset(competency.icon),
              ),

            SizedBox(height: 30.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                competency.title,
                style: context.headlineLarge.copyWith(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2C2C2C)),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                competency.subtitle,
                style: context.titleLarge.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2C2C2C)),
              ),
            ),
            SizedBox(height: 18.h),
            Center(
              child: Text(
                competency.description,
                textAlign: TextAlign.center,
                style: context.labelSmall.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff4C5157).withOpacity(0.8)),
              ),
            ),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomButton(
                       width: 258.w,
                    buttonText: 'Continue',
                    onPressed: () {
                      if (index == 0) {
                        Navigator.pushNamed(
                            context, RoutesName.surveyCompletionEmotions,
                            arguments: EmotionScreenMode.fromCompetencies);
                      } else if (index == 1) {
                          Navigator.pushNamed(context, RoutesName.situationPromptView);
                      } else if (index == 2) {
                          Navigator.pushNamed(context, RoutesName.stimulusView);
                      } else if (index == 3) {
                          Navigator.pushNamed(context, RoutesName.identifyLoopView);
                      }else if (index == 4) {
                          Navigator.pushNamed(context, RoutesName.triggerReflectionView);
                      } else if (index == 5) {
                          Navigator.pushNamed(context, RoutesName.defineProblemView);
                      }  else if (index == 6) {
                          Navigator.pushNamed(context, RoutesName.stressSpikeView);
                      }  else if (index == 7) {
                          Navigator.pushNamed(context, RoutesName.snapshotView);
                      } else if (index == 8) {
                          Navigator.pushNamed(context, RoutesName.setbackReflectionView);
                      }  else if (index == 9) {
                          Navigator.pushNamed(context, RoutesName.highEnergyMomentsView);
                      }  else if (index == 10) {
                          Navigator.pushNamed(context, RoutesName.coreStrengthView);
                      }  else if (index == 11) {
                          Navigator.pushNamed(context, RoutesName.setIntentionView);
                      }  else if (index == 12) {
                          Navigator.pushNamed(context, RoutesName.celebrateWinView);
                      } 
                    },
                  ),
                ),
              ],
            ),
            40.h.verticalSpace,
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
