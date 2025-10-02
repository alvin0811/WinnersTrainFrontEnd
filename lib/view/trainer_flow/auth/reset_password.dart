import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerResetPassword extends StatelessWidget {
   TrainerResetPassword({super.key});

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
         appBar: CustomAuthAppBar(
          onPressed: () {
           Navigator.pushNamed(context, RoutesName.trainerForgotpassword);
          },
          appBarHeight: 290.h,
          logoPath: "assets/images/logo.png",
          showBackButton: true,
          showText: false,
          titleText: "Forgot Password",
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                50.verticalSpace,
                CustomInputWidget(
                  controller: newPasswordController, 
                  Header: "New Password",
                  prefixIconPath: "assets/svg/lock1.svg",
                  hint: "* * * * * * * * *",
                  label: "Password",
                ),
                20.verticalSpace,
                CustomInputWidget(
                  controller: confirmPasswordController,
                  Header: "Confirm New Password",
                  prefixIconPath: "assets/svg/lock1.svg",
                  hint: "* * * * * * * * *",
                  label: "Confirm Password",
                ),
                20.verticalSpace,
                 CustomButton(
                              loading: false,

                  buttonText: "Reset Now",
                 onPressed: () {
                    String newPassword = newPasswordController.text.trim();
                    String confirmPassword = confirmPasswordController.text.trim();
                    if (newPassword == confirmPassword) {
                      Navigator.pushNamed(context, RoutesName.trainerLogin);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Passwords do not match!"),),
                      );
                    }
                 },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
