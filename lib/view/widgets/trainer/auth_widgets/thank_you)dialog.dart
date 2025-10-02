import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/utils/app_colors.dart';

class ThankYouDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onContinue;
  final String? buttontext;

  const ThankYouDialog({
    Key? key,
    required this.title,
    this.buttontext,
    required this.description,
    required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/bg.png"),
    fit: BoxFit.cover,
  ),),
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        
        child: Container(
          width: double.infinity, 
          height: double.infinity, 
         decoration: const BoxDecoration(
      //   image: DecorationImage(
      // image: AssetImage("assets/images/bg.png"),
      // fit: BoxFit.cover,
      //   ),
      ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// SVG Icon
              SvgPicture.asset(
                "assets/svg/thanksicon.svg",
                height: 80.h,
              ),
              SizedBox(height: 20.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF121314),
                ),
              ),
              SizedBox(height: 10.h),
      
              /// Description Text
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyle.button( 
                ),
              ),
              SizedBox(height: 25.h),
      
              /// Continue Button
              SizedBox(width: 161.w,
                child: CustomButton(
                  buttonText: buttontext ?? "",
                  onPressed: onContinue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
