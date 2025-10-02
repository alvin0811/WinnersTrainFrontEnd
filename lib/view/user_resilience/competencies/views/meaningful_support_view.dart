import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/micro_training_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
class MeaningfulSupportView extends StatelessWidget {
  const MeaningfulSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Offer Meaningful Support',
            ),
            body: Column(
              children: [
                
                DualToggleWidget(
                  alignment: Alignment.topLeft,
                  isSingleColumn: true,
                  question: 'Is someone around you struggling?',
                  options: const [
                    'Ask how they’re really doing',
                    'Offer to help with one thing',
                    'Remind them of their strengths',
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
                    Navigator.pushNamed(context, RoutesName.encouragingWordsView
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