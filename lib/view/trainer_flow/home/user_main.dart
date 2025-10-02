// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:winner_trains_app/view/widgets/trainer/navigation_item.dart';
// import 'package:winner_trains_app/view/trainer_flow/home/trainer_app_bar.dart';
// import 'package:winner_trains_app/view/trainer_flow/home/trainer_side_menu.dart';
// import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
// import 'package:provider/provider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:winner_trains_app/utils/routes/route_name.dart';

// class HomeMain extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final navigationProvider = Provider.of<TrainerMainHomeViewModel>(context);

//     return WillPopScope(
//       onWillPop: () async {
//         // Prevent navigation by returning false
//         // Optionally, you can show a confirmation dialog here if needed
//         return false;
//       },
//       child: SafeArea(
//         top: false,
//         bottom: false,
//         child: Container(decoration: BoxDecoration(
//         image: DecorationImage(
//       image: AssetImage("assets/images/bg.png"),
//       fit: BoxFit.cover,
//         ),
//       ),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             extendBody: true,
//             appBar: TrainerAppBar(currentIndex: navigationProvider.index),
//             drawer: const TrainerSideMenu(),
//             body: navigationProvider.pages[navigationProvider.index],
//             bottomNavigationBar: CurvedNavigationBar(
//               buttonBackgroundColor: Colors.transparent,
//               animationDuration: Duration(milliseconds: 600),
//               // height: 75.0,
//               color: Colors.black,
//               backgroundColor: Colors.transparent,
//               index: navigationProvider.index,
//               onTap: (index) {
//                 navigationProvider.updateIndex(index);
//               },
//               items: <Widget>[
//                 NavigationItem(
//                   img: "assets/images/n1.png",
//                   label: 'Home',
//                   tabIndex: 0,
//                   selectedIndex: navigationProvider.index,
//                   onTap: (index) {
//                     navigationProvider.updateIndex(index);
//                   },
//                 ),
//                 NavigationItem(
//                   img: "assets/images/n2.png",
//                   label: 'Communities',
//                   tabIndex: 1,
//                   selectedIndex: navigationProvider.index,
//                   onTap: (index) {
//                     navigationProvider.updateIndex(index);
//                   },
//                 ),
//                 NavigationItem(
//                   img: "assets/images/n3.png",
//                   label: 'Appointments',
//                   tabIndex: 2,
//                   selectedIndex: navigationProvider.index,
//                   onTap: (index) {
//                     navigationProvider.updateIndex(index);
//                   },
//                 ),
//                 NavigationItem(
//                   img: "assets/images/n4.png",
//                   label: 'Profile',
//                   tabIndex: 3,
//                   selectedIndex: navigationProvider.index,
//                   onTap: (index) {
//                     navigationProvider.updateIndex(index);
//                   },
//                 ),
//               ],
//             ),
//             floatingActionButton:
//                 navigationProvider.index == 0
//                     ? Opacity(
//                       opacity: 1.0,
//                       child: Container(
//                         width: 56.w,
//                         height: 56.h,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: LinearGradient(
//                             colors: [
//                               Color(0xff4C5157),
//                               Color(0xff121314),
//                             ],
//                             begin:
//                                 Alignment
//                                     .centerLeft,
//                             end:
//                                 Alignment.centerRight,
//                           ),
//                           border: Border.all(color: Colors.white, width: 3.0),
//                         ),
//                         child: FloatingActionButton(
//                           onPressed: () {
//                   Navigator.pushNamed(context, RoutesName.createpost);
//                           },
//                           backgroundColor: Colors.transparent,
//                           elevation: 0,
//                           child: Icon(Icons.add, color: Colors.white, size: 40.sp),
//                         ),
//                       ),
//                     )
//                     : null,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/view/trainer_flow/home/trainer_app_bar.dart';
import 'package:winner_trains_app/view/trainer_flow/home/trainer_side_menu.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<TrainerMainHomeViewModel>(context);
    int selectedIndex = navigationProvider.index;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            appBar: TrainerAppBar(currentIndex: selectedIndex),
            drawer: const TrainerSideMenu(),
            body: navigationProvider.pages[selectedIndex],
            bottomNavigationBar: Opacity(
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
                  navigationProvider.updateIndex(index);
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
                                  transform:
                                      GradientRotation(145 * 3.1416 / 180),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
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
                        'Appointments',
                        'Profile'
                      ][i],
                      labelStyle: AppTextStyle.small(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w400,
                        color: Colors.white,
                      ));
                }),
              ),
            ),
            floatingActionButton: selectedIndex == 0
                ? Opacity(
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
                          Navigator.pushNamed(context, RoutesName.createpost);
                        },
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        child:
                            Icon(Icons.add, color: Colors.white, size: 40.sp),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
