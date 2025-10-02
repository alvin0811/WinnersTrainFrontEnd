import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_enums.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/terms_conditions.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerSignUp extends StatefulWidget {
  const TrainerSignUp({super.key});

  @override
  State<TrainerSignUp> createState() => _TrainerSignUpState();
}

class _TrainerSignUpState extends State<TrainerSignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
          appBarHeight: 401.h,
          logoPath: "assets/images/logo.png",
          showBackButton: true,
          showText: true,
          text: "Sign Up",
          subtext: "Create new Account!",
          titleText: "Sign Up",
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                11.verticalSpace,
                CustomInputWidget(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  Header: "Email Address",
                  prefixIconPath: "assets/svg/email.svg",
                  hint: "alexander.benjamin@domain.com",
                  label: "Email",
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
                CustomInputWidget(
                  controller: confirmPasswordController,
                  Header: "Confirm Password",
                  prefixIconPath: "assets/svg/lock1.svg",
                  hint: "* * * * * * * * *",
                  label: "Confirm Password",
                ),
                11.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: isSelected,
                        builder: (_, value, __) {
                          return Checkbox(
                            value: value,
                            onChanged: (newValue) {
                              isSelected.value = newValue ?? false;
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          );
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('I agree to the ', style: AppTextStyle.body()),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsConditions(index: 1),
                                  ),
                                );
                              },
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff4C5157),
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const Text(
                              ' | ',
                              style: TextStyle(color: Color(0xff4C5157)),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsConditions(index: 0),
                                  ),
                                );
                              },
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff4C5157),
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              CustomButton(
                loading: false,
                buttonText: "Sign Up",
                onPressed: () {
                  G().user == UserRole.trainer
                      ? Navigator.pushNamed(
                          context, RoutesName.trainerVerification)
                      : Navigator.pushNamed(
                          context,
                          RoutesName.verificationCode,
                          arguments: VerificationFlow.signUp,
                        );
                },
              ),
              8.h.verticalSpace,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  children: [
                    TextSpan(
                        text: "Already have an account?",
                        style: AppTextStyle.body()),
                    TextSpan(
                      text: "Sign In", // The clickable part
                      style: AppTextStyle.body(
                        color: const Color(0xff48576E),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          G().user == UserRole.trainer
                              ? Navigator.pushNamed(
                                  context, RoutesName.trainerLogin)
                              : Navigator.pop(context);
                          print("Sign Up clicked");
                        },
                    ),
                  ],
                ),
              ),
              10.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
