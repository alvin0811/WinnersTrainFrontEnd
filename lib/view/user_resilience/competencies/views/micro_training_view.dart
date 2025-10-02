import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/dialog_box/audio_dialogbox.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

enum MicroTraining { fromTargetFocus, fromSpot, fromStimulus }

class MicroTrainingView extends StatelessWidget {
  final MicroTraining microTraining;
  const MicroTrainingView({super.key, required this.microTraining});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Micro-Training',
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,
                microTraining == MicroTraining.fromTargetFocus
                    ? Text(
                        'Boost your Focus.',
                        style: context.bodyMedium.copyWith(
                            fontSize: 20.sp,
                            color: Color(0xff2C2C2C),
                            fontWeight: FontWeight.bold),
                      )
                    : microTraining != MicroTraining.fromTargetFocus?  Text(
                        'Need an extra boost?',
                        style: context.bodyMedium.copyWith(
                            fontSize: 20.sp,
                            color: Color(0xff2C2C2C),
                            fontWeight: FontWeight.bold),
                      ) : SizedBox.shrink(),
                20.h.verticalSpace,
                Container(
                  height: 118.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: CustomShadows.defaultShadow),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.videoView);
                        },
                        child: Container(
                            width: 120.w,
                            height: 118.h,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              image: DecorationImage(
                                  image: AssetImage(
                                    AppAssets.images.patient,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              size: 40.sp,
                            )),
                      ),
                      10.w.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.h.verticalSpace,
                          Text(
                            'Short Video',
                            style: context.bodyMedium.copyWith(
                                color: Color(0xff2C2C2C),
                                fontWeight: FontWeight.w600),
                          ),
                          10.h.verticalSpace,
                          microTraining == MicroTraining.fromTargetFocus
                              ? Text(
                                  'Stay Calm Under Pressure',
                                  style: context.bodySmall.copyWith(
                                      color: Color(0xff48576E),
                                      fontWeight: FontWeight.w400),
                                )
                              : Text(
                                  'How to see the good in tough times',
                                  style: context.bodySmall.copyWith(
                                      color: Color(0xff48576E),
                                      fontWeight: FontWeight.w400),
                                ),
                          10.h.verticalSpace,
                          Text('60 Sec',
                              style: context.bodySmall.copyWith(
                                  color: Color(0xff2C2C2C),
                                  fontWeight: FontWeight.w400))
                        ],
                      )
                    ],
                  ),
                ),
                20.h.verticalSpace,
                Container(
                  height: 118.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: CustomShadows.defaultShadow),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(3),
                        width: 120.w,
                        height: 116.h,
                        decoration: BoxDecoration(
                            boxShadow: CustomShadows.defaultShadow,
                            color: Colors.lightBlueAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                              color: Colors.lightBlueAccent.withOpacity(0.3),
                            )),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/quote-icon.png',
                            fit: BoxFit.cover,
                            width: 82.w,
                            height: 82.h,
                          ),
                        ),
                      ),
                      10.w.horizontalSpace,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.h.verticalSpace,
                          Text(
                            microTraining == MicroTraining.fromTargetFocus
                                ? 'Quote'
                                  : microTraining != MicroTraining.fromTargetFocus? 'Quote of the Day': '',
                            style: context.bodyMedium.copyWith(
                                color: Color(0xff2C2C2C),
                                fontWeight: FontWeight.w600),
                          ),
                          10.h.verticalSpace,
                          SizedBox(
                            width: 300.w,
                            child: Text(
                              microTraining == MicroTraining.fromTargetFocus
                                  ? 'Where focus goes, energy flows. Direct your mind, and your life will follow.'
                                    : microTraining != MicroTraining.fromTargetFocus? 'Every setback is the beginning of a stronger comeback.': '',
                              style: context.bodySmall.copyWith(
                                color: Color(0xff48576E),
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.fade,
                              maxLines: 3, // show max 3 lines, then fade

                              softWrap: true, // 👈 allows wrapping
                            ),
                          ),
                        ],
                      ).paddingOnly(right: 10.w))
                    ],
                  ),
                ),
                20.h.verticalSpace,
                if (microTraining == MicroTraining.fromTargetFocus
                  ) ...[
                  Container(
                    height: 118.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: CustomShadows.defaultShadow),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 8.h,
                            left: 1.5.w,
                          ),
                          child: Transform.scale(
                            scale: 1.19,
                            child: InkWell(
                              onTap: () {
                                audioDialogBox(context);
                              },
                              child: Image.asset(
                                width: 120.w,
                                height: 118.h,
                                'assets/images/audio-image.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        10.w.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.h.verticalSpace,
                            Text(
                              'Audio',
                              style: context.bodyMedium.copyWith(
                                  color: Color(0xff2C2C2C),
                                  fontWeight: FontWeight.w600),
                            ),
                            10.h.verticalSpace,
                            Text(
                              '1-Minute Mindfulness Exercise',
                              style: context.bodySmall.copyWith(
                                  color: Color(0xff48576E),
                                  fontWeight: FontWeight.w400),
                            ),
                            10.h.verticalSpace,
                            Text('60 Sec',
                                style: context.bodySmall.copyWith(
                                    color: Color(0xff2C2C2C),
                                    fontWeight: FontWeight.w400))
                          ],
                        )
                      ],
                    ),
                  ),
                ]
              ],
            ).paddingSymmetric(horizontal: 20.w),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: () {
                    if (microTraining == MicroTraining.fromStimulus) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                  buttonText: 'Done',
                  width: 258.w,
                ),
                40.h.verticalSpace,
              ],
            )));
  }
}
