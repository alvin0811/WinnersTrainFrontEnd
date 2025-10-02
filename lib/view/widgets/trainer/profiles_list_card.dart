import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;

  const ProfileListItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              imagePath,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
            title: Text(
              name,
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: double.infinity,
            height: 1.h,
            color: Color(0xffCCCBCB),
          ),
        ],
      ),
    );
  }
}
