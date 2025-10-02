import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart'; // For OTP input
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart'; // Custom Colors

class TrainerVerificationCode extends StatefulWidget {
  final String role;
  final bool isForgotPassword;
  const TrainerVerificationCode({
    super.key,
    required this.role,
    this.isForgotPassword = false,
  });

  @override
  State<TrainerVerificationCode> createState() =>
      _TrainerVerificationCodeState();
}

class _TrainerVerificationCodeState extends State<TrainerVerificationCode> {
  ValueNotifier<int> resendCountdown = ValueNotifier<int>(30);

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  // Start the countdown for resend OTP
  void startResendTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (resendCountdown.value > 0) {
        resendCountdown.value--;
        startResendTimer();
      }
    });
  }

  void resendOTP() {
    print("Resend OTP");
    resendCountdown.value = 30;
    startResendTimer();
  }

  void navigateBasedOnContext() {
    if (widget.isForgotPassword) {
      Navigator.pushNamed(context, RoutesName.trainerResetPassword);
      print("Navigating to reset password screen...");
    } else {
      Navigator.pushNamed(context, RoutesName.trainerCreateProfile);
      print("Navigating to create profile screen...");
    }
  }

  void navigateBasedOnContextforbackbutton() {
    if (widget.isForgotPassword) {
      Navigator.pushNamed(context, RoutesName.trainerForgotpassword);
      print("Navigating to reset password screen...");
    } else {
      Navigator.pushNamed(context, RoutesName.selectUser);
      print("Navigating to create profile screen...");
    }
  }

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
            appBarHeight: 290.h,
            logoPath: "assets/images/logo.png",
            showBackButton: true,
            showText: false,
            titleText: "Verification Code",
            onPressed: () {
              Navigator.pop(context);
            }),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                50.verticalSpace,
                SizedBox(
                  width: 390.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    "We have sent you an email containing a 4-digit verification code. Please enter the code to\n verify your identity.",
                    style: AppTextStyle.button(fontWeight: FontWeight.w400),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                40.verticalSpace,
                SizedBox(
                  width: 293.w,
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    boxShadows: [
                      BoxShadow(
                        color: const Color(0x29000000),
                        offset: const Offset(0, 4),
                        blurRadius: 10.r,
                      ),
                    ],
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      if (value.length == 4) {
                        navigateBasedOnContext();
                      }
                    },
                    pinTheme: PinTheme(
                      activeBoxShadow: [
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                      shape: PinCodeFieldShape.box,
                      disabledColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      borderRadius: BorderRadius.circular(18.r),
                      borderWidth: 1.w,
                      fieldHeight: 60.h,
                      fieldWidth: 58.w,
                      inactiveColor: const Color(0xffE4EBF5),
                      activeColor: const Color(0xffE4EBF5),
                      selectedFillColor: Colors.white,
                      activeFillColor: Colors.white,
                    ),
                  ),
                ),
                20.verticalSpace,
                ValueListenableBuilder<int>(
                  valueListenable: resendCountdown,
                  builder: (context, value, child) {
                    return Visibility(
                      visible: value != 0,
                      child: Container(
                        width: 250.w,
                        height: 140.h,
                        clipBehavior: Clip.none,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: CircularPercentIndicator(
                          fillColor: Colors.transparent,
                          progressColor: const Color(0xff008B88),
                          backgroundColor: Colors.grey.shade300,
                          radius: 65.r,
                          lineWidth: 4,
                          percent: value / 30,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Container(
                            alignment: Alignment.center,
                            width: 116.w,
                            height: 116.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: SweepGradient(
                                colors: [Colors.white, Colors.white],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: Text(
                              '00:${value.toString().padRight(2, '0')}',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff121314),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: resendCountdown,
          builder: (context, value, child) {
            return Container(
              child: BottomAppBar(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (value == 0)
                        TextButton(
                          onPressed: resendOTP,
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              "Don't received the code? Resend",
                              style: AppTextStyle.button(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
