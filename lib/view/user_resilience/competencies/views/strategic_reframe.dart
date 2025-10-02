import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/toggle_options_widget.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class StrategicReframe extends StatelessWidget {
  const StrategicReframe({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Strategic Reframe',
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  20.h.verticalSpace,
                  ToggleOptionsWidget(
                    
                    alignment: Alignment.topLeft,
                      question: 'Tool suggests strategic lenses:',
                      options: const [
                        'Where’s the growth here?',
                        'What’s the quickest route forward?',
                        'Will this matter in a week/month?',
                        'Other'
                      ],
                      onChanged: (selected, other) => print(selected),
                      layout: ToggleLayout.onePerRow),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.tipView,arguments: {
                      'description':'Stuck? Flip the lens—new angles unlock smart solutions.',
                      'height':244.h
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
