import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:winner_trains_app/view/user_resilience/others/onboarding/onboarding_view1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splashbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimatedSplashScreen(
            splashIconSize: 238.w,
            curve: Curves.easeInOutBack,
            duration: 10,
            animationDuration: const Duration(
              seconds:3
            ),
            splash: Image.asset(
              AppAssets.images.appLogo,
              width: 304.w,
              height: 247.h,
              //fit: BoxFit.cover,
            ),
            splashTransition: SplashTransition.sizeTransition,
            nextScreen: OnboardingView1(),
            backgroundColor: Colors.transparent,
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Resiliency Training & Coaching App',
            style: context.titleMedium.copyWith(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          10.h.verticalSpace,
          Center(
            child: Text(
              textAlign: TextAlign.center,
              'Your Journey Toward Awareness,\n Strength & Growth',
              style: context.titleMedium.copyWith(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            ),
          )
        ]).paddingSymmetric(vertical: 70.h, horizontal: 20.w)
      ),
    );
  }
}
