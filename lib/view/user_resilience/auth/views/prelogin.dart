import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/buttons/pre_login_button.dart';
import 'package:winner_trains_app/view/widgets/custom_agreement_text.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';

class UserPreLogin extends StatelessWidget {
  const UserPreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            30.verticalSpace,
            PreLoginButton(
              buttonText: "Sign-In with Email Address",
              onPressed: () => Navigator.pushNamed(context, RoutesName.logIn),
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
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.createProfile, (r) => false);
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
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.createProfile, (r) => false);
              },
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
        ).paddingSymmetric(horizontal: 20.w),
        bottomNavigationBar: CustomAgreementText(),
      ),
    );
  }
}
