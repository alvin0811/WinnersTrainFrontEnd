// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class MyDropdownWidget extends StatelessWidget {
//   final List<String> options;
//   final String selectedValue;
//   final Function(String) onChanged;
//   final String? title;
//   final String text;
//   final double? customPadding;
//   final String? suffixIconPath;
//   final double? radius;
//   final String Header; // For suffix icon, SVG path
//   const MyDropdownWidget({
//     super.key,
//     required this.options,
//     required this.selectedValue,
//     required this.onChanged,
//     this.customPadding,
//     this.radius,
//     required this.text,
//     this.title,
//     this.suffixIconPath,
//     required this.Header,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (Header.isNotEmpty) ...[
//           Padding(
//             padding: EdgeInsets.only(left: customPadding ?? 0),
//             child: Text(
//               Header,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: Color(0xff121314),
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//           7.verticalSpace,
//         ],
//         Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Color(0xff2238500F),
//                 offset: Offset(0, 1),
//                 blurRadius: 10.r,
//               ),
//             ],
//           ),
//           child: DropdownButtonFormField<String>(
//             style: TextStyle(
//                 color: Color(0xff121314),
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400),
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(horizontal: 20.0.w),
//               hintText: title ?? "",
//               hintStyle: const TextStyle(color: Color(0xff121314)),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xff12131405)),
//                 borderRadius: BorderRadius.circular(28.r),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Color(0xff12131405)),
//                 borderRadius: BorderRadius.circular(radius ??28.r),
//               ),
//               fillColor: const Color(0xffFFFFFF),
//               filled: true,
//               suffixIcon: suffixIconPath != null
//                   ? Padding(
//                       padding: EdgeInsets.all(13.w),
//                       child: SvgPicture.asset(suffixIconPath!),
//                     )
//                   : null,
//             ),
//             items: options
//                 .map((String value) => DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     ))
//                 .toList(),
//             onChanged: (s) => onChanged(s!),
//             dropdownColor: const Color(0xffffffff),
//             borderRadius: BorderRadius.circular(10),
//             elevation: 0,
//             isExpanded: true,
//             focusColor: Colors.white,
//             isDense: true,
//             itemHeight: 48.0,
//             hint: Text(
//               text,
//               style: TextStyle(
//                 color: const Color(0xff9BA8BB),
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             onTap: () {
//               FocusManager.instance.primaryFocus
//                   ?.unfocus(); // Close keyboard on tap
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';

class MyDropdownWidget extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final Function(String) onChanged;
  final String? title;
  final String text;
  final double? customPadding;
  final String? suffixIconPath;
  final double? radius;
  final String Header;

  const MyDropdownWidget({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.customPadding,
    this.radius,
    required this.text,
    this.title,
    this.suffixIconPath,
    required this.Header,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Header.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(left: customPadding ?? 0),
            child: Text(Header,
                style: AppTextStyle.body(
                  fontWeight: FontWeight.w600,
                )),
          ),
          7.verticalSpace,
        ],
        Container(
          decoration: BoxDecoration(boxShadow: CustomShadows.defaultShadow),
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            value: selectedValue.isNotEmpty ? selectedValue : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
              hintText: title ?? '',
              hintStyle: const TextStyle(color: Color(0xff121314)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff12131405)),
                borderRadius: BorderRadius.circular(radius ?? 28.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff12131405)),
                borderRadius: BorderRadius.circular(radius ?? 28.r),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: suffixIconPath != null
                  ? Padding(
                      padding: EdgeInsets.all(13.w),
                      child: SvgPicture.asset(suffixIconPath!),
                    )
                  : null,
            ),
            hint: Text(text,
                style: AppTextStyle.body(
                  color: const Color(0xff9BA8BB),
                )),
            items: options
                .map((value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: AppTextStyle.body()),
                    ))
                .toList(),
            onChanged: (value) => onChanged(value!),
            //  onTap: () => FocusScope.of(context).unfocus(),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300.h,
              width: MediaQuery.of(context).size.width - 40.w, // screen padding
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              elevation: 4,
              offset: const Offset(0, -5),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ],
    );
  }
}
