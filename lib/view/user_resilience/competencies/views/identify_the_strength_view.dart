
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/tip_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
class IdentifyTheStrengthView extends StatelessWidget {
  const IdentifyTheStrengthView({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Identify the Strength Behind It',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
               
                  ToggleOptionsWidget(
                    
                    question:
                        'Which strength was behind this moment?',
                    options: const [
                      'Creativity',
                      'Empathy',
                      'Leadership',
                      'Persistence',
                      'Problem-Solving',
                      'Communication',
                      'Other'
                    ],
                    onChanged: (selected, other) => print(selected),
                  
                    layout: ToggleLayout.twoPerRow
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
                        context, RoutesName.tipView, arguments: {
                          'description':'Strengths are the qualities that naturally energize you—where you shine the most.',
                          'height':274.h,
                          'flowType':FlowType.spotStrength
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