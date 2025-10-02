import 'package:flutter/material.dart';
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
class PatternView extends StatelessWidget {
  const PatternView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'What’s the Pattern?',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
                  Image.asset(
                    'assets/images/pattern.png',
                    width: double.infinity,
                    height: 190.h,
                  ),
                  15.h.verticalSpace,
                  ToggleOptionsWidget(
                    hintText: 'User types a recurring thought ...',
                    alignment: Alignment.topLeft,
                    question:
                        'What type of thinking trap is this?',
                    options: const [
                      'Catastrophizing',
                      'All-or-Nothing Thinking',
                      'Should Statements',
                      'Mind Reading',
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
                        context, RoutesName.breakLoopView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
