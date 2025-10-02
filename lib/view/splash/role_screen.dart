import 'package:winner_trains_app/resources/app_strings.dart';
import 'package:winner_trains_app/utils/app_enums.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_border_radius.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_agreement_text.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/custom_auth_appbar.dart';

class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: CustomAuthAppBar(
          appBarHeight: 401.h,
          logoPath: "assets/images/logo.png",
          showBackButton: false,
          showText: true,
          text: "Welcome",
          subtext: "Select user type!",
          titleText: "Select User",
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.h.verticalSpace,
            ListView.builder(
                shrinkWrap: true,
                itemCount: AppStrings.type.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      height: 96.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                          boxShadow: CustomShadows.defaultShadow,
                          color: context.primary,
                          borderRadius: CustomBorderRadius.medium,
                          border: CustomBorder.thin(
                            color: Color(0xffbee0ec),
                          )),
                      child: ListTile(
                        title: Text(
                          'Continue as a ',
                          style: context.titleMedium.copyWith(
                              color: context.onPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          AppStrings.type[index],
                          style: context.headlineMedium.copyWith(
                              color: Color(0xff48576E), fontSize: 22.sp),
                        ),
                        trailing: Image.asset(
                          AppAssets.icon.userType,
                          width: 16.82.w,
                          height: 17.5.h,
                        ),
                      )).inkWell(
                    onTap: () {
                      G().setUserRole(
                          index == 0 ? UserRole.user : UserRole.trainer);
                      Navigator.pushNamed(
                        context,
                        index == 0
                            ? RoutesName.preLogin
                            : RoutesName.trainerPreLogin,
                      );
                    },
                    //  () => index == 0
                    //     ? Navigator.pushNamed(
                    //         context,
                    //         RoutesName.preLogin,
                    //       )
                    //     : null,
                  );
                }),
          ],
        ).paddingSymmetric(horizontal: 20.w),
        bottomNavigationBar: CustomAgreementText(),
      ),
    );
  }
}
