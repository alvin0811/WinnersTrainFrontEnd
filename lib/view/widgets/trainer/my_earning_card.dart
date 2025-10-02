import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/trainer_flow/home/my_earning.dart';

class MonthlyEarningCard extends StatelessWidget {
  final String month;
  final List<EarningTransaction> transactions;

  const MonthlyEarningCard({
    super.key,
    required this.month,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(month, style: AppTextStyle.heading()),
            Divider(color: const Color(0xFFDDE2E8), thickness: 1),
            SizedBox(height: 10.h),
            ...transactions.asMap().entries.map((entry) {
              int index = entry.key;
              EarningTransaction t = entry.value;
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoText(t.name,
                          width: 84.w, fontWeight: FontWeight.bold),
                      _infoText(t.date, width: 81.w),
                      _infoText(t.charge,
                          width: 48.w, fontWeight: FontWeight.w900),
                      _infoText(t.earning,
                          width: 60.w,
                          color: const Color(0xff0066FF),
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  if (index != transactions.length - 1)
                    Divider(color: const Color(0xFFDDE2E8), thickness: 1),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _infoText(String text,
      {double? width, Color? color, FontWeight? fontWeight}) {
    return SizedBox(
      width: width,
      child: Text(text,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.body(
            fontWeight: fontWeight ?? FontWeight.w400,
            color: color ?? const Color(0xff121314),
          )),
    );
  }
}
