import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isSelected = ValueNotifier<bool>(true);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(title: "Settings"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionTitle("assets/svg/46 (1) (1).svg", "Account"),
                settingsCard([
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.chnagespassword);
                    },
                    child: buildTile(
                      "assets/svg/Mask Group 13099.svg",
                      "Change Password",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomDialog(
                        context: context,
                        iconPath: "assets/svg/Group 15615 (4).svg",
                        title: "Delete Account!",
                        description:
                            "Are you sure you want to delete\naccount?",
                        buttonText: "No",
                        secondaryButtonText: "Yes, Delete",
                        onPressed: () {
                          Navigator.pop(context);
                          print("Post Deleted");
                        },
                        onPressed1: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, RoutesName.selectUser);

                          print("Cancelled");
                        },
                      );
                    },
                    child: buildTile(
                      "assets/svg/Mask Group 13100.svg",
                      "Delete Account",
                      isLast: true,
                    ),
                  ),
                ]),
                14.verticalSpace,
                sectionTitle(
                  "assets/svg/Mask Group 13143.svg",
                  "Notifications",
                ),
                settingsCard([
                  buildTile(
                    "assets/svg/Mask Group 13143.svg",
                    "Push Notifications",
                    trailing: ValueListenableBuilder<bool>(
                      valueListenable: isSelected,
                      builder: (_, value, __) {
                        return Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: value,
                            onChanged: (newVal) => isSelected.value = newVal,
                            activeTrackColor: Colors.green,
                            activeColor: Colors.white,
                            inactiveThumbColor: const Color(0xff48576E),
                            inactiveTrackColor: const Color(0xffE0E7F0),
                          ),
                        );
                      },
                    ),
                    isLast: true,
                  ),
                ]),
                14.verticalSpace,
                sectionTitle("assets/svg/Mask Group 13149.svg", "More"),
                settingsCard([
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.blockeduser);
                    },
                    child: buildTile(
                      "assets/svg/Mask Group 19 (1).svg",
                      "Blocked Users",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.settingtermscadition);
                    },
                    child: buildTile(
                      "assets/svg/Mask Group 19 (2).svg",
                      "Terms & Conditions",
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.settingPrivacyPolicy);
                      },
                      child: buildTile(
                          "assets/svg/Mask Group 20.svg", "Privacy Policy")),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.settingaboutapp);
                    },
                    child: buildTile(
                      "assets/svg/Mask Group 20 (1).svg",
                      "About App",
                      isLast: true,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String iconPath, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          20.horizontalSpace,
          Text(
            "$title",
            style: AppTextStyle.button(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTile(
    String iconPath,
    String title, {
    Widget? trailing,
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          leading: SvgPicture.asset(iconPath),
          title: Text(
            title,
            style: AppTextStyle.button(fontWeight: FontWeight.w400),
          ),
          trailing: trailing ??
              SvgPicture.asset("assets/svg/Mask Group 13071 (1).svg"),
        ),
        if (!isLast)
          Divider(
            color: const Color(0xFFDDE2E8),
            thickness: 1,
            indent: 10.w,
            endIndent: 10.w,
          ),
        // 10.verticalSpace,
      ],
    );
  }

  Widget settingsCard(List<Widget> tiles) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: BorderSide(color: Color(0xff1213141A)),
      ),
      child: Column(children: tiles),
    );
  }
}
