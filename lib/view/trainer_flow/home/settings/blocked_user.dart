import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';

class BlockedUser extends StatelessWidget {
  BlockedUser({super.key});

  // Dummy user data with ValueNotifier
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Alexander Benjamin',
      'image': 'assets/images/cardprofileimg.png',
      'isBlocked': ValueNotifier<bool>(true),
    },
    {
      'name': 'Jessica Parker',
      'image': 'assets/images/cardprofileimg.png',
      'isBlocked': ValueNotifier<bool>(true),
    },
    {
      'name': 'Samuel Dawson',
      'image': 'assets/images/cardprofileimg.png',
      'isBlocked': ValueNotifier<bool>(true),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(title: "Blocked Users"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              26.verticalSpace,
              CustomInputWidget(
                Header: "",
                prefixIconPath: "assets/svg/Mask Group 13120.svg",
                hint: "Search members..",
                label: "",
              ),
              20.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              user['image'],
                              width: 50.w,
                              height: 50.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            user['name'],
                            style: AppTextStyle.button(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: ValueListenableBuilder<bool>(
                            valueListenable: user['isBlocked'],
                            builder: (_, isBlocked, __) {
                              return GestureDetector(
                                onTap: () {
                                  user['isBlocked'].value = !isBlocked;
                                },
                                child: Container(
                                  width: 90.w,
                                  height: 38.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35.r),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xff0AB2AE),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      isBlocked ? 'Unblock' : 'Blocked',
                                      style: AppTextStyle.button(
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(
                          color: const Color(0xFFDDE2E8),
                          thickness: 1,
                          indent: 10.w,
                          endIndent: 10.w,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
