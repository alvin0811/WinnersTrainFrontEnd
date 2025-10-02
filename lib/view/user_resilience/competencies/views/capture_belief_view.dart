import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class CaptureBeliefView extends StatelessWidget {
  const CaptureBeliefView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Capture Belief',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
                  Container(
                    height: 246.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 3.h),
                    decoration: BoxDecoration(
                        boxShadow: CustomShadows.defaultShadow,
                        color: Colors.lightBlueAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(35.r),
                        border: Border.all(
                          color: Colors.lightBlueAccent.withOpacity(0.3),
                        )),
                    child: Image.asset(
                      'assets/images/stimulus.png',
                      width: 171.w,
                      height: 240.h,
                    ),
                  ),
                  15.h.verticalSpace,
                  ToggleOptionsWidget(
                    alignment: Alignment.topLeft,
                    question:
                        'What did you believe about this situation?',
                    options: const [
                      'I learned Something New',
                      'I Stayed Calm Under Pressure',
                      'I Showed Up Even When it was Hard',
                      'Other'
                    ],
                    onChanged: (selected, other) => print(selected),
                    layout: ToggleLayout.onePerRow,
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.h.verticalSpace,
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RoutesName.impactView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
