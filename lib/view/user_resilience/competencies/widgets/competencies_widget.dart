import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';

class CompetenciesWidget extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  const CompetenciesWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
          boxShadow: CustomShadows.defaultShadow,
          color: Colors.lightBlueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: Colors.lightBlueAccent.withOpacity(0.3),
          )),
      child: Row(
        children: [
          Opacity(
            opacity: 0.7,
            child: Container(
              margin: EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
              width: 75.w,
              height: 90.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Image.asset(image),
            ),
          ),
          10.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: context.bodySmall.copyWith(
                          color: Color(0xff2C2C2C), fontWeight: FontWeight.bold),
                    ),
                  Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: Icon(Icons.arrow_forward_ios, size: 20.sp,color: Colors.grey.withOpacity(0.9),),
                  )
                  ],
                ),
                8.h.verticalSpace,
                Text(
                  desc,
                  style: context.bodySmall.copyWith(
                      color: Color(0xff4C5157),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
