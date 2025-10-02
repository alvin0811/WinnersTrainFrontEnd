import 'package:winner_trains_app/utils/basic_exports.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.pushReplacementNamed(context, RoutesName.selectUser);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(AppAssets.images.splash),
//                     fit: BoxFit.fill)),
//             child: Center(
//               child: Image.asset(
//                 AppAssets.images.appLogo,
//                 width: 304.w,
//                 height: 247.h,
//                 //fit: BoxFit.cover,
//               ),
//             )));
//   }
// }




import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:winner_trains_app/view/splash/role_screen.dart';

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
            animationDuration: const Duration(seconds: 3,),
            splash: Image.asset(
                AppAssets.images.appLogo,
                width: 304.w,
                height: 247.h,
                //fit: BoxFit.cover,
              ),
            splashTransition: SplashTransition.sizeTransition,
            nextScreen: const SelectUserScreen(),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
