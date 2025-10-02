import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class CustomDialogbox extends StatelessWidget {
  final String? titletext;
  final String bodyText;
  final Widget? icon;
  final String? cancelButtonText;
  final String? confirmButtonText;
  final VoidCallback onTapCancel;
  final VoidCallback onTapProceed;

  const CustomDialogbox(
      {super.key,
      this.titletext,
      this.icon,
      this.cancelButtonText,
      required this.bodyText,
      this.confirmButtonText,
      required this.onTapCancel,
      required this.onTapProceed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
          width: 370.w,
          height: 324.h,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              color: context.primary,
              border: CustomBorder.thin(color: Color(0xffE4EBF5)),
              boxShadow: CustomShadows.customShadow),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: icon ??
                      SvgPicture.asset(
                        AppAssets.icon.delete,
                        fit: BoxFit.cover,
                        height: 100.h,
                        width: 100.w,
                      )),
              20.h.verticalSpace,
              Center(
                child: Text(
                  titletext ?? 'Delete!',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: context.onPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                  child: Text(
                bodyText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: context.onPrimary),
              )),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                          width: 147.w,
                          height: 44.h,
                          text: confirmButtonText ?? "Yes, delete",
                          fontcolor: Colors.black,
                          border: Border.all(color: Color(0xff0AB2AE)),
                          isGradient: false,
                          color: context.primary)
                      .inkWell(onTap: onTapProceed),
                  20.w.horizontalSpace,
                  CustomButton(
                    width: 147.w,
                    height: 44.h,
                    text: cancelButtonText ?? "No",
                    isGradient: true,
                    gradient: const LinearGradient(
                      begin: Alignment(0.97, -1.0), // ~174 degrees
                      end: Alignment(-0.97, 1.0),
                      colors: [
                        Color(0xFF4C5157), // Start color
                        Color(0xFF121314), // End color
                      ],
                    ),
                  ).inkWell(onTap: onTapCancel),
                ],
              )
            ],
          ).paddingSymmetric(vertical: 30.h)),
    );
  }
}
