
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/micro_training_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/tip_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class ActionPlanView extends StatelessWidget {
  const ActionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Action Plan',
            ),
            body: Column(
              children: [
                
                DualToggleWidget(
                  alignment: Alignment.topLeft,
                  isSingleColumn: true,
                  question: 'Set your leadership statement: How will you lead?',
                  options: [
                    'I’ll lead with calm and clarity.',
                    'I’ll guide the group with empathy and a clear plan.',
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
                          'description':'Strong leaders don’t copy others they lead by using what they do best.',
                          'height':244.h,
                          'flowType':FlowType.leadStrength
                        });
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
