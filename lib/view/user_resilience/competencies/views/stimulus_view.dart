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
class StimulusView extends StatelessWidget {
  const StimulusView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Stimulus (Event Identification)',
            ),
            body: Column(
              children: [
                20.h.verticalSpace,
                ToggleOptionsWidget(
                  question: 'What happened?',
                  options: const [
                    'Friend didn’t text back',
                    'Failed a Test',
                    'Got Cut off in Traffic',
                  
                 
                    'Other'
                  ],
                  onChanged: (selected, other) => print(selected),
                  layout: ToggleLayout.twoPerRow,
                ),
              
              ],
            ).paddingSymmetric(horizontal: 20.w),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {
                     Navigator.pushNamed(context, RoutesName.captureBeliefView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
