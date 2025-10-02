import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class ChnagePassword extends StatelessWidget {
  const ChnagePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(title: "Change Password"),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              26.verticalSpace,
              CustomInputWidget(
                Header: "Enter Existing Password",
                prefixIconPath: "assets/svg/lock1.svg",
                hint: "* * * * * * * * *",
                label: "Password",
              ),
              20.verticalSpace,
              CustomInputWidget(
                Header: "Enter New Password",
                prefixIconPath: "assets/svg/lock1.svg",
                hint: "* * * * * * * * *",
                label: "adada",
              ),
              20.verticalSpace,
              CustomInputWidget(
                Header: "Enter Confirm New Password",
                prefixIconPath: "assets/svg/lock1.svg",
                hint: "* * * * * * * * *",
                label: "adada",
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(
            buttonText: "Change Now",
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.settingscreen);
            },
          ),
        ),
      ),
    );
  }
}
