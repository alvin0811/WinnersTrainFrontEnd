
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/micro_training_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/dual_toggle_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class ChooseStrengthView extends StatelessWidget {
  const ChooseStrengthView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Choose Strength-Based Tone',
            ),
            body: Column(
              children: [
                
                DualToggleWidget(
                  alignment: Alignment.topLeft,
                  isSingleColumn: true,
                  question: 'How do you want to show up in this conversation?',
                  options: [
                    'With Honesty and Kindness',
                    'With Calm and Clarity',
                    'With Empathy and Courage',
                    'With Respect and Strength'
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
                    Navigator.pushNamed(context, RoutesName.conversationBuilderView
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
