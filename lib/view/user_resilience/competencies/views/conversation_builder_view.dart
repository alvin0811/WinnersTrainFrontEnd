import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class ConversationBuilderView extends StatelessWidget {
  const ConversationBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Conversation Builder (Dynamic Form)',
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.h.verticalSpace,
                 
                  CustomTextfield(
                    headerText: 'What went well?',
                    headerFontSize: 18.sp,
                    maxLines: 7,
                    shadow: false,
                    height: 169.h,
                    hintColor: Color(0xff9BA8BB),
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
                  15.h.verticalSpace,
                  CustomTextfield(
                    headerText: 'What could be improved?',
                    headerFontSize: 18.sp,
                    maxLines: 7,
                    shadow: false,
                    height: 169.h,
                    hintColor: Color(0xff9BA8BB),
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
                  15.h.verticalSpace,
                  CustomTextfield(
                    headerText: 'How can we move forward?',
                    headerFontSize: 18.sp,
                    maxLines: 7,
                    shadow: false,
                    height: 169.h,
                    hintColor: Color(0xff9BA8BB),
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
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.h.verticalSpace,
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.tipView, arguments: {
                      'description':'The way you speak shapes the outcome lead with clarity, and connect with respect.',
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
