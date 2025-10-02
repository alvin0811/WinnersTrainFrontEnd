import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/micro_training_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart'
    show CustomAppBar;
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class AlignYourGoals extends StatelessWidget {
  final controller = TextEditingController();
  AlignYourGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Align Your Goals',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h.verticalSpace,
          Text(
            'User sets or reviews their top 1–2 short-term goals',
            style: context.bodyMedium.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff121314)),
          ),
          20.h.verticalSpace,
          CustomTextfield(
            maxLines: 7,
            shadow: false,
            height: 200.h,
            hintColor: Color(0xff9BA8BB),
            controller: controller,
            hintText: "Type here...",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xff0AB2AE))),
            focusBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Color(0xff0AB2AE))),
            onChanged: (val, controller) {
              // vm.selectOption("Other", val);
              //  onChanged("Other", val);
            },
          ),
          10.h.verticalSpace,
          const Divider(
            color: Color(0xffDDE2E8),
          ),
          15.h.verticalSpace,
          DualToggleWidget(
            question:
                'Does your current mindset help you move toward this goal?',
             options: ["Yes", "No"],
            onChanged: (selected) {
              print("Dual Selected: $selected");
            },
          ),
          25.h.verticalSpace,
          Container(
            width: double.infinity,
            height: 106.h,
             padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
                boxShadow: CustomShadows.defaultShadow,
                color: Colors.lightBlueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: Colors.lightBlueAccent.withOpacity(0.3),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Try This Reframe:',
                  style: context.bodyMedium.copyWith(
                      color: Color(0xff2C2C2C), fontWeight: FontWeight.bold),
                ),
                10.h.verticalSpace,
                Text(
                  'Forget past mistakes; focus on the actions you can take right now.',
                  style: context.bodyMedium.copyWith(
                      color: Color(0xff4C5157), fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 20.w),
           bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {

                     Navigator.pushNamed(context, RoutesName.microTraining, arguments: MicroTraining.fromTargetFocus);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )
    ));
  }
}
