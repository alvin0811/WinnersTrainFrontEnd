import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
//import 'package:winner_trains_app/view/widgets/custom_curved_navigation_bar.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/user_drawer.dart';

import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

import '../../widgets/custom_button.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<UserHomeViewModel>(context);
    int selectedIndex = homeProvider.index;

    String appBarTitle;
    switch (homeProvider.index) {
      case 0:
        appBarTitle = 'Home';
        break;
      case 1:
        appBarTitle = 'Communities';
        break;
      case 2:
        appBarTitle = 'Survey';
        break;
      case 3:
        appBarTitle = 'Appointments';
        break;
      default:
        appBarTitle = '';
    }

    return CustomBackground(
      child: Consumer<UserHomeViewModel>(
        builder: (context, vm, _) {
          return SafeArea(
            bottom: true,
            top: false,
            child: Scaffold(
                key: _key,
                drawer: const UserDrawer(),
                extendBody: true,
                backgroundColor: Colors.transparent,
                appBar: homeProvider.index == 0
                    ? CustomAppBarProfile(
                        height: 136.h,
                        title: appBarTitle,
                        fontWeight: FontWeight.bold,
                        oncallBack: () => _key.currentState!.openDrawer(),
                        icon: Image.asset("assets/images/menu.png"),
                        actionsHome: [
                          Image.asset("assets/images/notification.png").inkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              RoutesName.notifications,
                            ),
                          )
                        ],
                      )
                    : CustomAppBar(
                        title: appBarTitle,
                        fontWeight: FontWeight.bold,
                        onBack: () => _key.currentState!.openDrawer(),
                        icon: Image.asset("assets/images/menu.png"),
                        actions: [
                          Image.asset("assets/images/notification.png").inkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              RoutesName.notifications,
                            ),
                          )
                        ],
                      ),
                body: vm.pages[selectedIndex],
                bottomNavigationBar: Container(
                  color: selectedIndex == 2
                      ? const Color(0xffEEF1F7)
                      : Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (selectedIndex == 2)
                        const CustomButton(
                          text: 'Please Answer all to Continue',
                        )
                            .inkWell(
                                onTap: () => Navigator.pushNamed(
                                      context,
                                      RoutesName.surveyCompletionEmotions,
                                      arguments: EmotionScreenMode.fromHome,
                                    ))
                            .paddingSymmetric(vertical: 10.h),
                      if (selectedIndex == 2) 30.verticalSpace,
                      Opacity(
                        opacity: 0.9,
                        child: CurvedNavigationBar(
                          iconPadding: 0,
                          index: selectedIndex,
                          backgroundColor: Colors.transparent,
                          color: Colors.black,
                          buttonBackgroundColor: Colors.transparent,
                          animationCurve: Curves.easeInOut,
                          animationDuration: const Duration(milliseconds: 700),
                          onTap: (index) {
                            vm.updateIndex(index);
                          },
                          items: List.generate(4, (i) {
                            bool isSelected = i == selectedIndex;
                            return CurvedNavigationBarItem(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    if (isSelected)
                                      Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFF0AB2AE),
                                              Color(0xFF0AB2AE),
                                              Color(0xFFFFCEB3),
                                            ],
                                            transform: GradientRotation(
                                                145 * 3.1416 / 180),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(0, 6),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    Image.asset(
                                      "assets/images/n${i + 1}.png",
                                      width: 24.w,
                                      height: 24.h,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                label: [
                                  'Home',
                                  'Communities',
                                  'Survey',
                                  'Appointments'
                                ][i],
                                labelStyle: AppTextStyle.small(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                  color: Colors.white,
                                ));
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
            
                // bottomNavigationBar: CurvedNavigationBar(
                //   itemNames: const [
                //     'Home',
                //     'Communities',
                //     'Survey',
                //     'Appointments'
                //   ],
                //   // key: navigationKey,
                //   color: const LinearGradient(
                //     colors: [Color(0xff121314), Color(0xff4C5157)],
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //   ),
                //   buttonBackgroundGradient: const LinearGradient(
                //     colors: [Color(0xFFFFCEB3), Color(0xFF0AB2AE)],
                //     begin: Alignment.topRight,
                //     end: Alignment.bottomLeft,
                //   ),
                //   backgroundColor: Colors.transparent,
                //   index: vm.bottomNavIndex,
                //   animationCurve: Curves.easeInOut,
                //   animationDuration: const Duration(milliseconds: 300),
                //   items: [
                //     SvgPicture.asset(
                //       AppAssets.icon.homeIcon,
                //       width: 24.w,
                //       height: 24.h,
                //     ),
                //     SvgPicture.asset(AppAssets.icon.communitiesIcon,
                //         width: 24.w, height: 24.h),
                //     SvgPicture.asset(AppAssets.icon.surveyIcon,
                //         width: 24.w, height: 24.h),
                //     SvgPicture.asset(AppAssets.icon.appointmentIcon,
                //         width: 24.w, height: 24.h),
                //   ],
                //   onTap: (index) {
                //     vm.bottomNavIndex = index;
                //   },
                // ),
                floatingActionButton: vm.index == 0
                    ? Visibility(
                        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                        child: Opacity(
                          opacity: 1.0,
                          child: Container(
                            width: 56.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff4C5157),
                                  Color(0xff121314),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              border: Border.all(color: Colors.white, width: 3.0),
                            ),
                            child: FloatingActionButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RoutesName.userCreatePost);
                              },
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 40.sp),
                            ),
                          ),
                        ),
                      )
                    // ? Container(
                    //     width: 50.54.w,
                    //     height: 50.54.h,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: context.primary, width: 3.w),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             blurRadius: 6.r,
                    //             color: Color(0xff00000029),
                    //             offset: Offset(0, 3))
                    //       ],
                    //       shape: BoxShape.circle,
                    //       gradient: const LinearGradient(
                    //         begin: Alignment.topCenter,
                    //         end: Alignment(0.0349, 1.0),
                    //         colors: [
                    //           Color(0xff4C5157),
                    //           Color(0xFf121314),
                    //         ],
                    //       ),
                    //     ),
                    //     child: Icon(
                    //       Icons.add,
                    //       color: context.primary,
                    //       size: 30,
                    //     ),
                    //   ).inkWell(
                    //     onTap: () => Navigator.pushNamed(
                    //       context,
                    //       RoutesName.userCreatePost,
                    //     ),
                    //   )
                    : null),
          );
        },
      ),
    );
  }
}
