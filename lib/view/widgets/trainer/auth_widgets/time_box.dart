import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/time_am_pm_widget.dart';

class TimeBox extends StatelessWidget {
  final TextEditingController controller;
  final String amPm;
  final VoidCallback onTap;

  const TimeBox({
    Key? key,
    required this.controller,
    required this.amPm,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0XFF48576E80)),
        borderRadius: BorderRadius.all(Radius.circular(8.r))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TimeTextField(
              controller: controller,
              hintText: "time",
              labelText: "",
              errorMessage: '',
              keyboardType: TextInputType.number,
              width: 122.w,
              readonly: true,
              onTap: onTap,
            ),
          ),
          SizedBox(width: 2.w),
          
          TimeAmPmWidget(amPm: amPm, onTap: onTap),
        ],
      ),
    );
  }
}
class TimeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String errorMessage;
  final TextInputType keyboardType;
  final double width;
  final bool readonly;
  final VoidCallback onTap;

  const TimeTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.errorMessage,
    required this.keyboardType,
    required this.width,
    this.readonly = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      readOnly: readonly,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        errorText: errorMessage.isEmpty ? null : errorMessage,
        border: InputBorder.none,
      ),
      onTap: onTap,
      keyboardType: keyboardType,
    );
  }
}
