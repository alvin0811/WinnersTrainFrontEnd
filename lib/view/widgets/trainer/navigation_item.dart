import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_colors.dart';

class NavigationItem extends StatelessWidget {
  final String label;
  final int tabIndex;
  final int selectedIndex;
  final String img;
  final Function(int) onTap;

  const NavigationItem({
    super.key, 
    required this.label,
    required this.tabIndex,
    required this.selectedIndex,
    required this.onTap, 
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        // Apply the gradient background only if the tab is selected
        gradient: selectedIndex == tabIndex ? AppColors.buttonGradient : null,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 4),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => onTap(tabIndex),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                color: selectedIndex == tabIndex ? Colors.white : Colors.white,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 2.h), 
              if (selectedIndex != tabIndex)
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.0.sp,
                    fontWeight:  FontWeight.w400,
                  ),
                )
              else
                SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
