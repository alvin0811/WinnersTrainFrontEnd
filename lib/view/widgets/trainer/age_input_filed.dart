import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

import 'package:winner_trains_app/view/widgets/trainer/custom_date_picker.dart';
import 'package:winner_trains_app/utils/app_colors.dart';

class AgeInputField extends StatelessWidget {
  final TextEditingController controller;

  const AgeInputField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Age", style: AppTextStyle.body(fontWeight: FontWeight.w600)),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff2238500F),
                  offset: Offset(0, 1),
                  blurRadius: 10.r,
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              // readOnly: true,
              style: AppTextStyle.body(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: "Enter your Age",
                hintStyle: TextStyle(
                  color: const Color(0xff121314),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff12131405),
                  ),
                  borderRadius: BorderRadius.circular(28.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff12131405),
                  ),
                  borderRadius: BorderRadius.circular(28.r),
                ),
                fillColor: const Color(0xffFFFFFF),
                filled: true,

                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.calendar_month, color: Colors.black,),
                //   onPressed: () {
                //     showDialog(
                //       barrierColor: AppColors.backgroundColor.withOpacity(0.8),
                //       context: context,
                //       builder: (_) => CustomDatePicker(
                //         initialDate: DateTime.now(),
                //         controller: controller,
                //       ),
                //     );
                //   },
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
