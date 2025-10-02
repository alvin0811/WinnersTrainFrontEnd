import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/micro_training_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
class EncouragingWordsView extends StatelessWidget {
  const EncouragingWordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Share Encouraging Words',
            ),
            body: Column(
              children: [
                
                DualToggleWidget(
                  alignment: Alignment.topLeft,
                  isSingleColumn: true,
                  question: 'Write a quick message to inspire or uplift someone?',
                  options: const [
                    'You matter. Keep going',
                    'I believe in you',
                    'You’ve handled tough times before—you’ll get through this one too.',
                    'With Respect and Strength',
                  ],
                  onChanged: (selected) {
                    print("Dual Selected: $selected");
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 20.w),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.tipView,
                    arguments: {
                      'description':'Lifting others lifts you too—small words of support can spark big waves of strength.',
                      'height':262.h
                    }
                       );
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}