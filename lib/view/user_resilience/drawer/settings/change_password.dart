import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Change Password',
            ),
            body: Column(
              children: [
                CustomTextfield(
                  // controller: passwordController,
                  obsecureText: true,
                  customPadding: 20.w,
                  headerText: 'Enter Existing Password',
                  hintText: '* * * * * * * * *',
                  prefixIcon: Image.asset(
                    AppAssets.icon.passwordIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                15.h.verticalSpace,
                CustomTextfield(
                  // controller: passwordController,
                  obsecureText: true,
                  customPadding: 20.w,
                  headerText: 'Enter New Password',
                  hintText: '* * * * * * * * *',
                  prefixIcon: Image.asset(
                    AppAssets.icon.passwordIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                15.h.verticalSpace,
                CustomTextfield(
                  // controller: passwordController,
                  obsecureText: true,
                  customPadding: 20.w,
                  headerText: 'Enter Confirm New Password',
                  hintText: '* * * * * * * * *',
                  prefixIcon: Image.asset(
                    AppAssets.icon.passwordIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                Spacer(),
                CustomButton(
                  text: 'Change Now',
                ).inkWell(onTap: () => Navigator.pop(context))
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
