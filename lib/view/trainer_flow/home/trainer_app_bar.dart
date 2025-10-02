import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;

  const TrainerAppBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (currentIndex == 0 ? 30.h : 0));

  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    switch (currentIndex) {
      case 0:
        appBarTitle = 'Home';
        break;
      case 1:
        appBarTitle = 'Communities';
        break;
      case 2:
        appBarTitle = 'My Appointments';
        break;
      case 3:
        appBarTitle = 'My Profile';
        break;
      default:
        appBarTitle = '';
    }

    if (currentIndex == 0) {
      return Container(
        width: 430.w,
        height: 124.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          color: AppColors.backgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/images/homeappbarbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              print("Menu clicked");
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset("assets/images/menu.png"),
          ),
          title: Text(
            appBarTitle,
            style: AppTextStyle.button(
              color: const Color(0xffFFFFFF),
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            if (currentIndex == 0) ...[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.notification);
                  },
                  child: Image.asset("assets/images/notification.png"),
                ),
              ),
            ],
          ],
        ),
      );
    } else if (currentIndex == 3) {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            print("Menu clicked");
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset("assets/images/menu.png"),
        ),
        title: Text(
          appBarTitle,
          style: AppTextStyle.button(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.editprofile);
            },
            child: Image.asset("assets/images/edit.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.notification);
              },
              child: Image.asset("assets/images/notification.png"),
            ),
          ),
        ],
      );
    } else {
      return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            print("Menu clicked");
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset("assets/images/menu.png"),
        ),
        title: Text(
          appBarTitle,
          style: AppTextStyle.button(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.notification);
              },
              child: Image.asset("assets/images/notification.png"),
            ),
          ),
        ],
      );
    }
  }
}
