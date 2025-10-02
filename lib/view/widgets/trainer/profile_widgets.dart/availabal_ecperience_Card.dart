import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class AvailabalEcperienceCard extends StatelessWidget {
  final String imageStart; 
  final String imageEnd;   
  final String text;       
  final Function()? onTap; 
  
  const AvailabalEcperienceCard({
    Key? key,
    required this.imageStart,
    required this.imageEnd,
    required this.text,
    this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: SizedBox(
        width: 390.w, 
        height: 62.h,
        child: Card(elevation: 5,
          color: Colors.white,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Color(0xffE7ECF2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      imageStart,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250.w, 
                  child: Text(
                    text, 
                    style: AppTextStyle.button(fontWeight: FontWeight.bold)
                  ),
                ),
                Image.asset(
                  imageEnd,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
