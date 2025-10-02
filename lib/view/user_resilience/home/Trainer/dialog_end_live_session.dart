import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

void leaveLiveSessionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        backgroundColor: context.primary,
        child: Container(
          width: 370.w, // 👈 Increase width here
          height: 200.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              color: context.primary,
              border: CustomBorder.thin(color: Color(0xffE4EBF5)),
              boxShadow: CustomShadows.customShadow), // 👈 Increase height here
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Leave live session!",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: context.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    'Are you sure you want to leave this live session?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: context.onPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: 147.w,
                      height: 44.h,
                      text: "Yes, Leave",
                      fontcolor: Colors.black,
                      border: Border.all(color: Color(0xff0AB2AE)),
                      isGradient: false,
                      color: context.primary,
                    ).inkWell(onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.homeScreen, (route) => false);
                    }),
                    20.w.horizontalSpace,
                    CustomButton(
                      width: 147.w,
                      height: 44.h,
                      text: "No",
                      isGradient: true,
                      gradient: const LinearGradient(
                        begin: Alignment(0.97, -1.0),
                        end: Alignment(-0.97, 1.0),
                        colors: [
                          Color(0xFF4C5157),
                          Color(0xFF121314),
                        ],
                      ),
                    ).inkWell(onTap: () {
                      Navigator.of(context).pop();
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
