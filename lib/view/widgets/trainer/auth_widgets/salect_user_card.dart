import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class SalectUserCard extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const SalectUserCard({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 390.w,
        height: 96.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff008B884D), // Light border color with opacity
            width: 2.w, // Border width
            style: BorderStyle.solid, // Solid line border
          ),
          color: Color(0xffFFFFFF), // Background color
          borderRadius:
              BorderRadius.circular(15.r), // Rounded corners with radius
          boxShadow: [
            BoxShadow(
              color: Color(0xff223850)
                  .withOpacity(0.1), // Shadow color with transparency
              blurRadius: 10, // Blur radius for the shadow
              offset: Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            "Continue as a",
            style: AppTextStyle.button(),
          ),
          subtitle: Text(
            title, // The dynamic title passed
            style: TextStyle(
              fontSize: 22.sp, fontWeight: FontWeight.bold,
              color: Color(0xff48576E), // Slightly lighter text color
            ),
          ),
          trailing: Image.asset(
            "assets/images/Group 16038.png",
            width: 16.82.sp,
            height: 17.5.h,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
