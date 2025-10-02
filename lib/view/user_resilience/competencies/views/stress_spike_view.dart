

import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/intensity_scale_widget.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
class StressSpikeView extends StatelessWidget {
  const StressSpikeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Stress Spike Check-In',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
               
                  ToggleOptionsWidget(
                   
                  horizomtalPadding: 10.w,
                  
                    question:
                        'What triggered your stress just now?',
                    options: const [
                      'Deadline Pressure',
                      'Argument with Someone',
                      'Too much Noise/Crowd',
                      'Overthinking',
                      'Other'
                    ],
                    onChanged: (selected, other) => print(selected),
                    layout: ToggleLayout.twoPerRow,
                  ),
                  15.h.verticalSpace,
                  Text('How intense does your stress level feel right now?', style:
                   context.bodyMedium.copyWith(color: Color(0xff121314), fontSize: 18.sp, fontWeight: FontWeight.w600),),
                   15.h.verticalSpace,
                   IntensityScaleSlider(
          min: 1,
          max: 10,
          initialValue: 5,
          onChanged: (value) {
            debugPrint("Selected intensity: $value");
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
                    Navigator.pushNamed(
                        context, RoutesName.enerygyResetPromptView);
                  },
                  buttonText: 'Next',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
  

