import 'package:winner_trains_app/utils/app_enums.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: CustomAuthAppBar(
          onPressed: () {
            Navigator.pop(context);
          },
          appBarHeight: 290.h,
          logoPath: "assets/images/logo.png",
          showBackButton: true,
          showText: false,
          titleText: "Forgot Password",
        ),
        body: Column(
          children: [
            30.h.verticalSpace,
            CustomTextfield(
              controller: emailController,
              customPadding: 20.w,
              headerText: 'Email Address',
              hintText: 'henry.benjamin@domain.com',
              prefixIcon: Image.asset(
                AppAssets.icon.loginEmailIcon,
                width: 24.w,
                height: 24.h,
              ),
            ),
            30.h.verticalSpace,
            CustomButton(
              borderRadius: BorderRadius.circular(35.r),
              text: 'Continue',
            ).inkWell(onTap: () {
              Navigator.pushNamed(
                context,
                RoutesName.verificationCode,
                arguments: VerificationFlow.forgotPassword,
              );
            }),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
