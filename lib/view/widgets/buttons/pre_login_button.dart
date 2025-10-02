import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class PreLoginButton extends StatelessWidget {
  final String buttonText; // Text displayed on the button
  final VoidCallback? onPressed; // Action when the button is pressed
  final String imagePath; // Path to the image for the icon (e.g., "assets/images/email.png")
  final LinearGradient? gradient; // Gradient for the background of the button
  final Color? shadowColor; // Custom shadow color

  // Constructor with required and optional parameters
  const PreLoginButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.imagePath,
    this.gradient,
    this.shadowColor, // Optional shadow color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 390.w,
        height: 52.h,
       
        decoration: BoxDecoration(
          gradient: gradient ?? LinearGradient(
            colors: [Colors.blue, Colors.green], 
            begin: Alignment.centerLeft, 
            end: Alignment.centerRight, 
          ),
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? Color(0x29000000), 
              offset: Offset(0, 4),
              blurRadius: 10.r,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image widget
            SizedBox(
              width: 100.w,
              child: Image.asset(
                imagePath, // Dynamic image path
                width: 24.w,
                height: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            // Button text
            SizedBox(
              width: 250.w,
              child: Text(
                buttonText, // Dynamic text
                style: AppTextStyle.button(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
