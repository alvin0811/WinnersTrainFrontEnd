import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/custom_divider.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/video_player_slider.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';

void audioDialogBox(BuildContext context) {
  double sliderValue = 0.0;
  Duration current = Duration(seconds: 10);
  Duration total = Duration(minutes: 2);
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: AppColors.backgroundColor,
            insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              height: 206.h,
              //padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 25,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, right: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/audio.png',
                        width: 110.w,
                        height: 108.h,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Audio',
                                  style: context.bodyMedium.copyWith(
                                      color: Color(0xff2C2C2C),
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                    width: 40.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        boxShadow: CustomShadows.defaultShadow,
                                        color: Colors.lightBlueAccent
                                            .withOpacity(0.2),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.lightBlueAccent
                                              .withOpacity(0.3),
                                        )),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.teal,
                                    )).paddingSymmetric(horizontal: 10.w)
                              ],
                            ),
                            8.h.verticalSpace,
                            Text(
                              '1-Minute Mindfulness Exercise',
                              style: context.bodySmall.copyWith(
                                  color: Color(0xff48576E),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  10.h.verticalSpace,
                  Row(
                    children: [
                      Text(
                        '00:21',
                        style: context.bodySmall.copyWith(
                            color: Color(0xff121314),
                            fontWeight: FontWeight.w400),
                      ),
                      8.w.horizontalSpace,
                      SizedBox(
                        width: 248.w,
                        child: VideoProgressSlider(
                          currentPosition: current,
                          totalDuration: total,
                          onChanged: (val) {
                            // seek video player here
                            print("New slider value: $val");
                          },
                        ),
                      ),
                      8.w.horizontalSpace,
                      Text(
                        '01:00',
                        style: context.bodySmall.copyWith(
                            color: Color(0xff121314),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 15.w)
                ],
              ),
            ));
      });
}
