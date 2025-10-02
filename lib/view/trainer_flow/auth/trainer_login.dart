import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerLogin extends StatefulWidget {
  const TrainerLogin({super.key});

  @override
  State<TrainerLogin> createState() => _TrainerLoginState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _TrainerLoginState extends State<TrainerLogin> {
  ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAuthAppBar(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.trainerPreLogin);
          },
          appBarHeight: 401.h,
          logoPath: "assets/images/logo.png",
          showBackButton: true,
          showText: true,
          text: "Welcome Back",
          subtext: "Sign-In to Continue!",
          titleText: "Sign In",
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                30.verticalSpace,
                CustomInputWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  Header: "Email Address",
                  prefixIconPath: "assets/svg/email.svg",
                  hint: "alexander.benjamin@domain.com",
                  label: "adada",
                ),
                11.verticalSpace,
                CustomInputWidget(
                  controller: passwordController,
                  Header: "Password",
                  prefixIconPath: "assets/svg/lock1.svg",
                  hint: "* * * * * * * * *",
                  label: "Password",
                ),
                11.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 220.w,
                        child: Row(
                          children: [
                            ValueListenableBuilder<bool>(
                              valueListenable: isSelected,
                              builder: (_, value, __) {
                                return Transform.scale(
                                  scale: 0.7,
                                  child: Switch(
                                    activeTrackColor: Colors.green,
                                    value: value,
                                    onChanged: (bool newValue) {
                                      isSelected.value = newValue;
                                    },
                                    activeColor: Colors.white,
                                    inactiveThumbColor:
                                        const Color(0xff48576E),
                                    inactiveTrackColor:
                                        const Color(0xffE0E7F0),
                                  ),
                                );
                              },
                            ),
                            Text("Remember Me",
                                style: AppTextStyle.body(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.trainerForgotpassword,
                          );
      
                          print("Forgot Password clicked");
                        },
                        child: Text(
                          "Forgot your Password?",
                          style: TextStyle(
                            color: const Color(0xff121314),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                CustomButton(
                             loading: false,

                  buttonText: "Sign In",
                 onPressed: () {
                    Navigator.pushNamed(context, RoutesName.homemain);
                    bottomindex.updateIndex(0);
                 },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ), // Default text style
              children: [
                TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyle.body()),
                TextSpan(
                  text: "Sign Up", // The clickable part
                  style: AppTextStyle.body(
                    color: const Color(0xff48576E),
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, RoutesName.trainerSignup);
                      print("Sign Up clicked");
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
