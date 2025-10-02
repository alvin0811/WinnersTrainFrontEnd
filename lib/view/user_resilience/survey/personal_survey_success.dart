import 'package:flutter_svg/svg.dart';

import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/best_resilience_trainer.dart';

import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';

class PersonalSurveySuccess extends StatelessWidget {
  const PersonalSurveySuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarVM = Provider.of<UserHomeViewModel>(context);
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: SvgPicture.asset(AppAssets.icon.likeIcon,
                          width: 100.w, height: 100.h)),
                  10.h.verticalSpace,
                  Center(
                    child: Text(
                      'Thank You!',
                      style: context.headlineSmall.copyWith(
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  10.h.verticalSpace,
                  Center(
                      child: Text(
                    'Your personalization has been completed.\nYou are a Depress Person',
                    textAlign: TextAlign.center,
                    style: context.titleMedium,
                  )),
                  20.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        width: 193.w,
                        height: 48.h,
                        border: CustomBorder.thin(
                          color: Color(0xff0AB2AE),
                        ),
                        isGradient: false,
                        text: 'Book an appointment',
                        fontsize: 14.sp,
                        fontcolor: context.onPrimary,
                        color: context.primary,
                        fontWeight: FontWeight.w500,
                      ).inkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RoutesName.bestResilienceTrainer, arguments: TrainerRoute.fromsurvey)),
                      16.w.horizontalSpace,
                      CustomButton(
                        width: 181.w,
                        fontsize: 14.sp,
                        height: 48.h,
                        text: 'Back to home',
                      ).inkWell(onTap: () {
                        navBarVM.index = 0;

                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutesName.homeScreen, (r) => false);
                      })
                    ],
                  ),
                  40.h.verticalSpace,
                  CustomButton(
                    height: 48.h,
                    color: context.primary,
                    border: CustomBorder.thin(
                      color: Color(0xff0AB2AE),
                    ),
                    isGradient: false,
                    fontcolor: context.onPrimary,
                    fontWeight: FontWeight.w500,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.icon.downloadIcon,
                          width: 19.w,
                          height: 19.h,
                          fit: BoxFit.cover,
                        ),
                        10.w.horizontalSpace,
                        Text(
                          'Download Survey',
                          style: context.titleMedium
                              .copyWith(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ]).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
