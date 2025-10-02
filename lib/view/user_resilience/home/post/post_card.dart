import 'package:dotted_border/dotted_border.dart';

import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';

import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class PostCard extends StatelessWidget {
  final String? titleText;
  final String? buttonText;
  final String? optionalText;
  final Widget? icon;
  final VoidCallback onTap;
  const PostCard(
      {super.key,
      this.titleText,
      this.buttonText,
      this.optionalText,
      required this.onTap,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextfield(
          headerText: 'Title',
          headerTextColor: context.onPrimary,
          customPadding: 20.w,
          hintText: 'Add Title',
          hintColor: Colors.black.withOpacity(0.4),
          hintTextSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        10.h.verticalSpace,
        CustomTextfield(
          headerText: 'Description',
          headerTextColor: context.onPrimary,
          customPadding: 20.w,
          radius: BorderRadius.circular(15.r),
          hintText: 'Type here....',
          hintColor: Colors.black.withOpacity(0.4),
          maxLines: 6,
          height: 157.h,
          fontWeight: FontWeight.w500,
          hintTextSize: 14.sp,
        ),
        20.h.verticalSpace,
        DottedBorder(
          dashPattern: [7, 7, 7, 7],
          color: Color(0xffD0D8E3),
          borderType: BorderType.RRect,
          radius: Radius.circular(15),
          // padding: EdgeInsets.all(6),
          strokeCap: StrokeCap.square,
          child: Container(
            width: double.infinity,
            height: 170.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon ??
                    Image.asset(
                      AppAssets.icon.addMoreIcon,
                      width: 26.45.w,
                      height: 23.92.h,
                      fit: BoxFit.cover,
                    ),
                Text(
                  optionalText ?? 'Add More',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: context.onPrimaryContainer.withOpacity(0.5),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
        30.h.verticalSpace,
        CustomButton(text: buttonText ?? 'Post').inkWell(onTap: onTap)
      ],
    ).paddingSymmetric(horizontal: 20.w, vertical: 20.h);
  }
}
