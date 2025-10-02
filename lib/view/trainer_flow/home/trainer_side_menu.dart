import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/resources/app_assets.dart';
import 'package:winner_trains_app/resources/extensions/context_extension.dart';
import 'package:winner_trains_app/resources/theme/color_scheme.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/extensions/custom_padding.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/logout_dialog.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerSideMenu extends StatelessWidget {
  const TrainerSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 348.w,
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/dawerbg2.png"),
            fit: BoxFit.fill,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.h.verticalSpace,
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.homemain);
                      bottomindex.updateIndex(3);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      width: 150.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        border: Border.all(color: const Color(0xff0AB2AE), width: 5.w),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/profileimg.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Alexandar Benjamin',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:AppTextStyle.heading(fontWeight: FontWeight.w400,)
                ),
              ),
              5.h.verticalSpace,
              Center(
                child: Text(
                  'alexanderbenjamin@domain.com',
                style: AppTextStyle.body(),
                ),
              ),
              40.h.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  drawerItem("assets/images/Mask Group 134.png", "Home").inkWell(onTap: () {
                  Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.homemain);
                    bottomindex.updateIndex(0);
                                    }),
                  drawerItem(
                    "assets/images/Mask Group 135.png",
                    "My Appointments",
                  ).inkWell(onTap: () {
                  Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.homemain);
                    bottomindex.updateIndex(2);
                                    }),
                  drawerItem(
                    "assets/images/Mask Group 13155.png",
                    "My Earning",
                  ).inkWell(onTap: () {
                  Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.myearning);
                                    }),
                  drawerItem(
                    "assets/images/Mask Group 13143.png",
                    "Analytics",
                  ).inkWell(onTap: () {
                  Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.analytics);
                                    }),
                  drawerItem(
                    "assets/images/Mask Group 131555.png",
                    "Saved Post",
                  ).inkWell(onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.savedpost);
                                    }),
                  drawerItem(
                    "assets/images/Mask Group 13108.png",
                    "Subscription",
                  ).inkWell(onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.renewsubscription);
                                    }),
                  drawerItem(
                    "assets/images/Mask Group 18.png",
                    "Help & Feedback",
                  ).inkWell(onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.feedbackform);
                                    }),
                  GestureDetector(
                    onTap: () {
                    
                    },
                    child: drawerItem(
                      "assets/images/Mask Group 17.png",
                      "Settings",
                    ).inkWell(onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, RoutesName.settingscreen);
                  }),
                  ),
                ],
              ).paddingSymmetric(horizontal:20.w ),
              50.h.verticalSpace,
             CustomButton(
                height: 55.h,
                width: 230.w,
                isGradient: true,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4C5157),
                    Color(0xFF121314),
                  ],
                  begin: Alignment(0.1, 1.0),
                  end: Alignment(-0.1, -1.0),
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(28.0),
                  bottomRight: Radius.circular(28.0),
                  topLeft: Radius.zero,
                  bottomLeft: Radius.zero,
                ),
                child: Row(
                  children: [
                    10.w.horizontalSpace,
                    Image.asset(
                      AppAssets.icon.drawerLogoutIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
                    20.w.horizontalSpace,
                    Text(
                      'Logout',
                      style: GoogleFonts.roboto(
                          color: context.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ).inkWell(onTap: () {
                logoutDialog(context);
              }),
              20.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItem(String img, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        children: [
          Image.asset(
            img,
            width: 24.w,
            height: 24.h,
          ),
          16.w.horizontalSpace,
          Text(title,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColor.lightScheme.onPrimary,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}