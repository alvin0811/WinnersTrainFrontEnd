import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

import '../../../widgets/buttons/custom_button.dart';

class TargetFocusView extends StatelessWidget {
  const TargetFocusView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Self CheckIn',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
                  ToggleOptionsWidget(
                    question: 'What triggered that feeling?',
                    options: const [
                      'Past Failure',
                      'Upcoming Event',
                      'Family Problems',
                      'Marriage Life',
                      'Conflict',
                      'Other'
                    ],
                    onChanged: (selected, other) => print(selected),
                    layout: ToggleLayout.twoPerRow,
                    isDivider: true,
                  ),
                  15.h.verticalSpace,
                  DualToggleWidget(
                    question: 'Is this feeling helping or hurting your focus?',
                    options: [
                      'Helping',
                      'Hurting',
                    ],
                 
                    onChanged: (selected) {
                      print("Dual Selected: $selected");
                    },
                  )
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {
                     Navigator.pushNamed(context, RoutesName.alignYourGoalsView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
