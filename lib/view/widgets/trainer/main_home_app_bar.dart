import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class MainHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final List<Widget>? actions;

  const MainHomeAppBar({
    Key? key,
    required this.title,
    this.onBackTap,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          if (onBackTap != null) {
            onBackTap!();
          } else {
            Navigator.pop(context);
          }
        },
        child: Image.asset(
          "assets/images/back.png",
          width: 40.w,
          height: 40.h,
        ),
      ),
      title:
          Text(title, style: AppTextStyle.button(fontWeight: FontWeight.w700)),
      actions: actions,
    );
  }
}
