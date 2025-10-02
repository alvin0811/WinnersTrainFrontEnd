import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/resources/app_assets.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class ComYourStressRelated extends StatelessWidget {
  const ComYourStressRelated({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(
          title: "Community",
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.images.community,
                fit: BoxFit.cover,
                width: 430.w,
                height: 261.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleRow(),
                    10.verticalSpace,
                    Text(
                      "(Stress)",
                      style: AppTextStyle.button(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    16.verticalSpace,
                    Divider(color: const Color(0xffDDE2E8), thickness: 3),
                    16.verticalSpace,
                    _sectionTitle("About"),
                    8.verticalSpace,
                    _aboutText(),
                    16.verticalSpace,
                    _sectionTitle("Info"),
                    16.verticalSpace,
                    _infoRow("Community Activity"),
                    16.verticalSpace,
                    _infoRowWithIcon(
                      "assets/images/Path 28253.png",
                      "132 new posts today",
                    ),
                    16.verticalSpace,
                    _infoRowWithIcon(
                      "assets/images/Group 15637.png",
                      "1.6M members",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Stress-Related", style: AppTextStyle.heading()),
        Row(
          children: [
            Image.asset(
              "assets/images/Group 15634.png",
              width: 23.w,
              height: 19.h,
            ),
            5.horizontalSpace,
            Text(
              "Public",
              style: AppTextStyle.button(
                color: const Color(0xff4C5157),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyle.button(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _aboutText() {
    return Text(
      "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam sem, vel purus proin eleifend nisi dictum. "
      "Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis.",
      style: AppTextStyle.button(
        color: const Color(0xff4C5157),
      ),
    );
  }

  Widget _infoRow(String label) {
    return Text(
      label,
      style: AppTextStyle.button(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _infoRowWithIcon(String iconPath, String text) {
    return Row(
      children: [
        Image.asset(iconPath, width: 21.w, height: 19.h),
        15.horizontalSpace,
        Text(
          text,
          style: AppTextStyle.button(
            color: const Color(0xff4C5157),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
