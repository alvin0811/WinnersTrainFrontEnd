import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerForgotPassword extends StatelessWidget {
  TrainerForgotPassword({super.key});

  final TextEditingController emailController = TextEditingController();

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
            Navigator.pushNamed(context, RoutesName.trainerLogin);
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
                  controller: emailController,
                  Header: "Email Address",
                  prefixIconPath: "assets/svg/email.svg",
                  hint: "henry.benjamin@domain.com",
                  label: "",
                ),
                20.verticalSpace,
                CustomButton(
                              loading: false,

                  buttonText: "Continue",
                  onPressed: () {
                    String email = emailController.text.trim();
                    Navigator.pushNamed(
                      context,
                      RoutesName.trainerVerification,
                      arguments: {
                        'role': 'forgotPassword',
                        'isForgotPassword': true,
                        'email': email,
                      },
                    );
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
