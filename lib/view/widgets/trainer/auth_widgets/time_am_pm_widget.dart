import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeAmPmWidget extends StatelessWidget {
  final String amPm;
  final VoidCallback onTap;

  const TimeAmPmWidget({
    Key? key,
    required this.amPm,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color amPmColor = amPm == 'PM' ? Color(0xff0DCBC6) : Color(0xff4C5157);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: amPmColor,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Center(
          child: Text(
            amPm,
            style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
