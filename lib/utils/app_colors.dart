import 'package:flutter/material.dart'; 

class AppColors {
  static const Color backgroundColor = Color(0xFFF0F3F8);

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFFFFCEB3),
      Color(0xFF0AB2AE),  
      Color(0xFF0AB2AE),
      Color(0xFF0AB2AE),  
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
   static const LinearGradient bottomsheetGradient = LinearGradient(
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFE0E7F0), 
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
