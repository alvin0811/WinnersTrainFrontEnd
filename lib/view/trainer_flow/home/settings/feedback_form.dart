import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/thank_you)dialog.dart';
import 'package:winner_trains_app/view/widgets/trainer/help_and_feedback_addimage_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class FeedbackForm extends StatelessWidget {
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
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(title: "Help & Feedback"),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              20.verticalSpace,
              CustomInputWidget(
                Header: "Subject",
                hint: "Add Subject",
                label: "Add Subject",
              ),
              SizedBox(height: 20.h),
              CustomInputWidget(
                maxline: 6,
                Header: "Description",
                hint: "Type here...",
                label: "Type here...",
              ),
              20.verticalSpace,

              HelpAndFeedbackAddimageCard(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(
            buttonText: "Submit",
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.trainerfeedbacksubmitted);
            },
          ),
        ),
      ),
    );
  }
}
