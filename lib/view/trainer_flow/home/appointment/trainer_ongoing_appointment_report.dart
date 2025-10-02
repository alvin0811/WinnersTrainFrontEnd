import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';

class TrainerOngoingAppointmentReport extends StatelessWidget {
  const TrainerOngoingAppointmentReport({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// SVG Icon
              SvgPicture.asset(
                "assets/svg/thanksicon.svg",
                height: 80.h,
              ),
              SizedBox(height: 20.h),
              Text(
                "Report Issue!",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF121314),
                ),
              ),
              SizedBox(height: 10.h),

              /// Description Text
              Text(
                "Your report has been submitted \nsuccessfully!",
                textAlign: TextAlign.center,
                style: AppTextStyle.button(),
              ),
              SizedBox(height: 25.h),

              /// Continue Button
              SizedBox(
                width: 161.w,
                child: CustomButton(
                  buttonText: "Go Back",
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.ongoingappointemntdetails);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
