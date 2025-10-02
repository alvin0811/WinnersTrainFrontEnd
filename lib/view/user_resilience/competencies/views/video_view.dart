import 'package:flutter/material.dart';
import 'package:winner_trains_app/resources/app_assets.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/video_player_slider.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';

class VideoView extends StatelessWidget {
  VideoView({super.key});
  double sliderValue = 0.0;
  Duration current = Duration(seconds: 10);
  Duration total = Duration(minutes: 2);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/video-img.png',
              ))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              400.h.verticalSpace,
              Center(
                  child: Image.asset(
                AppAssets.icon.videoPauseIcon,
                width: 88.w,
                height: 88.h,
              )),
              Spacer(),
              Text(
                'Short Video',
                style: context.bodyMedium
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              10.h.verticalSpace,
              Text(
                'Stay Calm Under Pressure',
                style: context.labelMedium
                    .copyWith(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.w200, fontSize: 14.sp),
              ),
              10.h.verticalSpace,
              Text('60 Sec',
                  style: context.bodySmall.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400)),
                      15.h.verticalSpace,
              VideoProgressSlider(
                currentPosition: current,
                totalDuration: total,
                onChanged: (val) {
                  // seek video player here
                  print("New slider value: $val");
                },
              ),
              40.h.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 20.w)),
    );
  }
}
