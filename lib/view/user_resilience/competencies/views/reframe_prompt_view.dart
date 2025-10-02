import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
class ReframePromptView extends StatelessWidget {
  const ReframePromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Reframe Prompt',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
                  ToggleOptionsWidget(
                    alignment: Alignment.topLeft,
                    question: 'Now, look closer what’s one positive thing that came out of it?',
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
                CustomButton(
                  onPressed: () {
                     Navigator.pushNamed(context, RoutesName.brightSideReflectionView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}