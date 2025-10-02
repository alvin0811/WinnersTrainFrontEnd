import 'package:flutter/material.dart';
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
class IdentifyLoopView extends StatelessWidget {
  const IdentifyLoopView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Identify the Loop',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
               
                  ToggleOptionsWidget(
                    alignment: Alignment.topLeft,
                    hintText: 'User types a recurring thought ...',
                    question:
                        'What thought keeps spinning in your mind?',
                    options: const [
                      'Fear of Failure',
                      'Overthinking a Conversation',
                      'Worrying about the Future',
                      'Regret about the Past',
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
                        context, RoutesName.patternView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
