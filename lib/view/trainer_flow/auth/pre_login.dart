import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/pre_login_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/terms_conditions.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerPreLogin extends StatelessWidget {
  const TrainerPreLogin({super.key});

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
           Navigator.pushNamed(context, RoutesName.selectUser);
          },
          appBarHeight: 401.h,
          logoPath: "assets/images/logo.png",
          showBackButton: true,
          showText: true,
          text: "Welcome",
          subtext: "Select with login!",
          titleText: "Pre Login",
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              30.verticalSpace,
              PreLoginButton(
                buttonText: "Sign-In with Email Address",
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.trainerLogin);
                },
                imagePath: "assets/images/emailicon.png",
                gradient: LinearGradient(
                  colors: [Color(0xffE2CFCF), Color(0xff008B88)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shadowColor: Color(0xff008B884D),
              ),
              20.verticalSpace,
              PreLoginButton(
                buttonText: "Sign-In with Apple",
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.trainerCreateProfile);
                },
                imagePath: "assets/images/appleicon.png",
                gradient: LinearGradient(
                  colors: [Color(0xff414141), Color(0xff0A070E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shadowColor: Color(0xff0000171F),
              ),
              20.verticalSpace,
              PreLoginButton(
                buttonText: "Sign-In with Google",
                onPressed: () { Navigator.pushNamed(context, RoutesName.trainerCreateProfile);},
                imagePath: "assets/images/googleicon.png",
                gradient: LinearGradient(
                  colors: [Color(0xffEB4335), Color(0xff76221B)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shadowColor: Color(
                  0xff0000171F,
                ), 
              ),
            ],
          ),
        ),
        bottomNavigationBar: Opacity(
          opacity: 1.0,
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By sign-in, you agree to our',
                  style: AppTextStyle.body()
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TermsConditions(index: 1),
                          ),
                        );
                      },
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff4C5157),
                          fontWeight: FontWeight.bold,
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
                            builder: (context) => TermsConditions(index: 0),
                          ),
                        );
                      },
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff4C5157),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
