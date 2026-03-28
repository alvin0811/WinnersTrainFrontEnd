import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/app_enums.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/widgets/confirmation_text.dart';
 import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_checkbox.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
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
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              physics:
                  const BouncingScrollPhysics(), // Smooth iOS scroll behavior
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, // Better keyboard handling
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    15.h.verticalSpace,
                    CustomTextfield(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      customPadding: 20.w,
                      headerText: 'Email Address',
                      hintText: "alexander.benjamin@domain.com",
                      prefixIcon: Image.asset(
                        AppAssets.icon.loginEmailIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    10.h.verticalSpace,
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
                    10.h.verticalSpace,
                    CustomTextfield(
                      controller: confirmPasswordController,
                      obsecureText: true,
                      customPadding: 20.w,
                      headerText: 'Confirm Password',
                      hintText: "* * * * * * * * *",
                      prefixIcon: Image.asset(
                        AppAssets.icon.passwordIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    11.h.verticalSpace,
                    Row(
                      children: [
                        CustomCheckbox(),
                        Text(AppStrings.agreeText, style: context.bodySmall),
                        5.w.horizontalSpace,
                        Text(
                          AppStrings.termsAndConditions,
                          style: context.bodyMedium.copyWith(
                              color: context.onPrimaryContainer,
                              decoration: TextDecoration.underline,
                              decorationColor: context.onPrimaryContainer),
                        ).inkWell(
                            onTap: () => Navigator.pushNamed(
                                    context, RoutesName.agreement,
                                    arguments: {
                                      "index": 1,
                                    })),
                        5.w.horizontalSpace,
                        Text(
                          '|',
                          style: context.bodyMedium.copyWith(
                            color: context.onPrimaryContainer,
                          ),
                        ),
                        5.w.horizontalSpace,
                        Text(
                          AppStrings.privacyPolicy,
                          style: context.bodyMedium.copyWith(
                              color: context.onPrimaryContainer,
                              decoration: TextDecoration.underline,
                              decorationColor: context.onPrimaryContainer),
                        ).inkWell(onTap: () {
                          Navigator.pushNamed(context, RoutesName.agreement,
                              arguments: {
                                "index": 0,
                              });
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  borderRadius: BorderRadius.circular(35.r),
                  text: 'Sign Up',
                ).inkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutesName.verificationCode,
                    arguments: VerificationFlow.signUp,
                  ),
                ),
                20.h.verticalSpace,
                const ConfirmationText(
                  text: AppStrings.existingAccount,
                  confirmationText: 'Sign In',
                ).inkWell(
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          )),
    );
  }
}
