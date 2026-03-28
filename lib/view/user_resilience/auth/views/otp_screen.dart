import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:winner_trains_app/utils/app_enums.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/routes/global.dart';

import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';

class UserVerificationCode extends StatefulWidget {
  final String? role;
  final VerificationFlow flow;
  final bool isForgotPassword;
  const UserVerificationCode({
    super.key,
    this.role,
    required this.flow,
    this.isForgotPassword = false,
  });
  @override
  State<UserVerificationCode> createState() => _UserVerificationCodeState();
}

class _UserVerificationCodeState extends State<UserVerificationCode> {
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

  // Simulate OTP resend function
  void resendOTP() {
    print("Resend OTP");
    resendCountdown.value = 30; // Reset the countdown to 30 seconds
    startResendTimer();
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

  /// function for difference based on routing
  void onCodeVerified() {
    if (widget.flow == VerificationFlow.signUp) {
      Navigator.pushNamed(context, RoutesName.createProfile);
    } else if (widget.flow == VerificationFlow.forgotPassword) {
      Navigator.pushReplacementNamed(context, RoutesName.resetPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(291),
        //   child: AppBar(
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //     automaticallyImplyLeading: false,
        //     flexibleSpace: Container(
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage("assets/images/authbg.png"),
        //           fit: BoxFit.cover,
        //         ),
        //         borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(50.r),
        //           bottomRight: Radius.circular(50.r),
        //         ),
        //       ),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           55.verticalSpace,
        //           Image.asset(
        //             "assets/images/logo.png",
        //             width: 203.w,
        //             height: 165.h,
        //           ),
        //         ],
        //       ),
        //     ),

        //     leading: GestureDetector(
        //       onTap: () {
        //         navigateBasedOnContextforbackbutton();
        //       },
        //       child: Image.asset(
        //         "assets/images/back.png",
        //         width: 40.w,
        //         height: 40.h,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     title: Text(
        //       "Verification Code",
        //       style: TextStyle(
        //         fontSize: 16.sp,
        //         color: Color(0xffffffff),
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),

        //     centerTitle: true,
        //   ),
        // ),
        appBar: CustomAuthAppBar(
          appBarHeight: 290.h,
          logoPath: "assets/images/logo.png",
          showBackButton: true,
          showText: false,
          titleText: "Verification Code",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    style: AppTextStyle.button(
                      fontWeight: FontWeight.w400,
                    ),
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
                        onCodeVerified();
                      }
                    },
                    pinTheme: PinTheme(
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
                                fontWeight: FontWeight.bold,
                              ),
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
