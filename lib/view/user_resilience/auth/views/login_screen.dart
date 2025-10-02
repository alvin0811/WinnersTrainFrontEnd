import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/confirmation_text.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_switch.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});
  final ValueNotifier<bool> switchNotifier = ValueNotifier<bool>(false);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: CustomAuthAppBar(
          onPressed: () {
            Navigator.pop(context);
          },
          appBarHeight: 401.h,
          logoPath: "assets/images/logo.png",
          showBackButton: true,
          showText: true,
          text: "Welcome",
          subtext: "Sign-In to Continue!",
          titleText: "Sign In",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              30.h.verticalSpace,
              CustomTextfield(
                controller: emailController,
                customPadding: 20.w,
                headerText: 'Email Address',
                hintText: 'alexander.benjamin@domain.com',
                prefixIcon: Image.asset(
                  AppAssets.icon.loginEmailIcon,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              11.h.verticalSpace,
              CustomTextfield(
                controller: passwordController,
                obsecureText: true,
                customPadding: 20.w,
                headerText: 'Password',
                hintText: "* * * * * * * * *",
                prefixIcon: Image.asset(
                  AppAssets.icon.passwordIcon,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              11.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                              inactiveThumbColor: const Color(0xff48576E),
                              inactiveTrackColor: const Color(0xffE0E7F0),
                            ),
                          );
                        },
                      ),
                      // 5.w.horizontalSpace,
                      Text('Remember Me',
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w500))
                    ],
                  ),
                  Text(
                    'Forgot your Password?',
                    style: context.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: context.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ).inkWell(
                      onTap: () => Navigator.pushNamed(
                          context, RoutesName.forgetPassword))
                ],
              ),
              32.h.verticalSpace,
              CustomButton(
                borderRadius: BorderRadius.circular(35.r),
                text: 'Sign In',
              ).inkWell(onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.homeScreen,
                  (route) => false,
                );
              }),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ConfirmationText(
            text: AppStrings.newAccount,
            confirmationText: 'Sign Up',
          ).inkWell(
              onTap: () =>
                  Navigator.pushNamed(context, RoutesName.trainerSignup)),
        ),
      ),
    );
  }
}
