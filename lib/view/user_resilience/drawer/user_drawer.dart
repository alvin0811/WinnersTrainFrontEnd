import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/logout_dialog.dart';
// import 'package:winner_trains_app/view/user_resilience/others/logout_dialog.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_profile_image.dart';

// import 'package:winner_trains_app/viewModel/home_view_model.dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
    return Consumer<UserHomeViewModel>(
      builder: (context, value, child) {
        return Container(
          width: 348.w,
          height: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/dawerbg2.png"),
                fit: BoxFit.fill),
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
              topLeft: Radius.zero,
              bottomLeft: Radius.zero,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.h.verticalSpace,
              Center(
                  child: ProfilePicture(
                borderColor: Color(0xff0AB2AE),
                borderWidth: 7.w,
                imageUrl: AppAssets.images.patient,
                width: 130.w,
                height: 130.h,
              )).inkWell(onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, RoutesName.profileDetails);
              }),
              5.h.verticalSpace,
              Center(
                child: Text(
                  'Alexandar Benjamin',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20.sp, color: context.onPrimary),
                ),
              ),
              5.h.verticalSpace,
              Center(
                child: Text(
                  'alexanderbenjamin@domain.com',
                  style: TextStyle(fontSize: 14.sp, color: context.onPrimary),
                ),
              ),
              40.h.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  drawerItem(AppAssets.icon.drawerHomeIcon, "Home").inkWell(
                      onTap: () {
                    value.index = 0;
                    Navigator.pop(context);
                  }),
                  5.h.verticalSpace,
                  drawerItem(
                          AppAssets.icon.drawerAppointmentIcon, "Appointments")
                      .inkWell(onTap: () {
                  
                    Navigator.pop(context);
                    value.index = 3;
                  }),
                  5.h.verticalSpace,
                  
                  drawerItem(
                          AppAssets.icon.drawerCompetencyIcon, "Competencies")
                      .inkWell(onTap: () {
                    value.index = 0;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.competenciesView);
                  }),
                  5.h.verticalSpace,
                  drawerItem(AppAssets.icon.drawerBookmarkIcon,
                          "Bookmarked Resilience Trainer")
                      .inkWell(onTap: () {
                    value.index = 0;
                    Navigator.pop(context);

                    Navigator.pushNamed(
                        context, RoutesName.bookMarkedResilienceTrainer);
                  }),
                5.h.verticalSpace,
                  drawerItem(AppAssets.icon.drawerBookmarkIcon, "Saved Post")
                      .inkWell(onTap: () {
                    value.index = 0;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.userSavedPost);
                  }),
                5.h.verticalSpace,
                  drawerItem(AppAssets.icon.drawerPaymentHistoryIcon,
                          "Payment History")
                      .inkWell(onTap: () {
                    value.index = 0;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.paymentHistory);
                  }),
                 5.h.verticalSpace,
                  drawerItem(
                          AppAssets.icon.drawerSubscriptionIcon, "Subscription")
                      .inkWell(onTap: () {
                    value.index = 0;
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      RoutesName.subscription,
                      arguments: {'isfromLiveSession': false},
                    );
                  }),
                   5.h.verticalSpace,
                  drawerItem(AppAssets.icon.drawerHelpFeedbackIcon,
                          "Help & Feedback")
                      .inkWell(onTap: () {
                    value.index = 0;
                    Navigator.pop(context);

                    Navigator.pushNamed(
                        context, RoutesName.userHelpAndFeedBack);
                  }),
                   5.h.verticalSpace,
                  drawerItem(AppAssets.icon.drawerSettingsIcon, "Settings")
                      .inkWell(onTap: () {
                    value.index = 0;
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RoutesName.settings);
                  }),
                ],
              ).paddingSymmetric(horizontal: 20.w),
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
        ).inkWell(onTap: () => Navigator.pop(context));
      },
    );
  }

  Widget drawerItem(String icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11.h),
      child: Row(
        children: [
          Image.asset(
            icon,
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
