import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/view/widgets/trainer/profile_widgets.dart/review_card.dart';

class SeeRatingReviews extends StatelessWidget {
  const SeeRatingReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainHomeAppBar(title: "Rating & Reviews"),
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        children: [
                          Text("4.8",
                              style: GoogleFonts.roboto(
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "Overall Rating",
                            style: AppTextStyle.button(),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Image.asset(
                                  index < 4
                                      ? "assets/images/star.png"
                                      : "assets/images/Icon ion-ios-star-outline.png",
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 390.w,
                    child: Text(
                      "Reviews (23)",
                      style: AppTextStyle.button(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                10.verticalSpace,
                SizedBox(
                    width: 390.w,
                    child: Divider(color: Colors.grey.shade400, height: 24.h)),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        separatorBuilder: (_, __) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) => ReviewCard(),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
