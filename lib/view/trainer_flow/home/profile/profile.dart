import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/profile_widgets.dart/availabal_ecperience_Card.dart';
import 'package:winner_trains_app/view/widgets/trainer/profile_widgets.dart/my_details_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/profile_widgets.dart/review_card.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.verticalSpace,
                MyDetailsCard(),
                10.verticalSpace,
                AvailabalEcperienceCard(
                  imageStart: "assets/images/Mask Group 14109.png",
                  imageEnd: "assets/images/Mask Group 13071.png",
                  text: "Availability",
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.editavailability);
                    print("Card tapped!");
                  },
                ),
                10.verticalSpace,
                AvailabalEcperienceCard(
                  imageStart: "assets/images/experience.png",
                  imageEnd: "assets/images/Mask Group 13071.png",
                  text: "Experience & Qualifications",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.seeexperiencequalification,
                    );
                    print("Card tapped!");
                  },
                ),
                10.verticalSpace,
                SizedBox(
                  width: 380.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reviews (23)",
                          style: AppTextStyle.subHeading(
                            fontWeight: FontWeight.bold,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.seeratingreviews);
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff121314),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                SizedBox(
                  height: 200.h,
                  width: 390.w,
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ReviewCard();
                    },
                  ),
                ),
                150.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
