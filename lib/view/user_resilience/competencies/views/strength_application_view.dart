import 'package:flutter/material.dart';

import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class StrengthApplicationView extends StatelessWidget {
  const StrengthApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Reflect on Strengths Application',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
                  ToggleOptionsWidget(
                      question:
                          'How would you use your strengths in this scenario?',
                      options: const [
                        'Team Project',
                        'Family Decision',
                        'Helping a Friend',
                        'College Assignment',
                        'Other'
                      ],
                      onChanged: (selected, other) => print(selected),
                      layout: ToggleLayout.twoPerRow),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.h.verticalSpace,
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.actionPlanView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
