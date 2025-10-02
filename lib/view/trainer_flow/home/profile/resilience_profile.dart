import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/view/widgets/trainer/profile_widgets.dart/my_details_card.dart';
import 'package:winner_trains_app/view/widgets/trainer/profile_widgets.dart/review_card.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class ResilienceProfile extends StatelessWidget {
  const ResilienceProfile({super.key});

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
        appBar: const MainHomeAppBar(title: "Resilience Trainer"),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                10.verticalSpace,
                const MyDetailsCard(),
                10.verticalSpace,
                SizedBox(
                  width: 380.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reviews (23)",
                        style:AppTextStyle.subHeading(
                fontWeight: FontWeight.bold,)
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.seeratingreviews,
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff121314),
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
                      return const ReviewCard();
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
