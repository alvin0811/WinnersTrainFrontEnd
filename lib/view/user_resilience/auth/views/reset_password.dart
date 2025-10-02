import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(291),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/authbg.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  55.verticalSpace,
                  Image.asset(
                    "assets/images/logo.png",
                    width: 203.w,
                    height: 165.h,
                  ),
                ],
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.forgetPassword);
              },
              child: Image.asset(
                "assets/images/back.png",
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "Reset Password",
              style: AppTextStyle.button(
                color: const Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          30.h.verticalSpace,
          CustomTextfield(
            controller: newPasswordController,
            obsecureText: true,
            customPadding: 20.w,
            headerText: 'New Password',
            hintText: '* * * * * * * * *',
            prefixIcon: Image.asset(
              AppAssets.icon.passwordIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
          20.h.verticalSpace,
          CustomTextfield(
            controller: confirmPasswordController,
            obsecureText: true,
            customPadding: 20.w,
            headerText: 'Confirm Password',
            hintText: '* * * * * * * * *',
            prefixIcon: Image.asset(
              AppAssets.icon.passwordIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
          30.h.verticalSpace,
          CustomButton(
            borderRadius: BorderRadius.circular(35.r),
            text: 'Reset Password',
          ).inkWell(onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          }),
        ]).paddingSymmetric(
          horizontal: 20.w,
        ),
      ),
    );
  }
}
