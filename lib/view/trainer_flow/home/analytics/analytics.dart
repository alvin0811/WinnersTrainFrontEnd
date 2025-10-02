import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

import 'package:winner_trains_app/view/trainer_flow/home/analytics/montthly_graph.dart';
import 'package:winner_trains_app/view/trainer_flow/home/analytics/weekly_graph.dart';
import 'package:winner_trains_app/view/trainer_flow/home/analytics/yearly_graph.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/analytics_view_model.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnalyticsViewModel>(context);

    Widget _getSelectedScreen() {
      switch (controller.reportSelected) {
        case 0:
          return WeeklyGraph();
        case 1:
          return Monthlygraph();
        case 2:
          return Yearlygraph();
        default:
          return Container(color: Colors.red);
      }
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/back.png",
              width: 40.w,
              height: 40.h,
            ),
          ),
          title: Text(
            "Analytics",
            style: AppTextStyle.button(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                Container(
                  width: 390.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(28.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff2238500F),
                        offset: Offset(0, 1),
                        blurRadius: 10.r,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(controller.reportFilters.length, (
                        index,
                      ) {
                        return GestureDetector(
                          onTap: () {
                            // Update the selected tab
                            controller.selectReportSelected(index);
                          },
                          child: Container(
                            width: 128.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: controller.reportSelected == index
                                    ? [
                                        const Color(0xFFE2CFCF),
                                        const Color(0xFF008B88),
                                      ]
                                    : [
                                        const Color(0xffFFFFFF),
                                        const Color(0xffFFFFFF),
                                      ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(26.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                controller.reportFilters[index],
                                style: TextStyle(
                                  color: controller.reportSelected != index
                                      ? const Color(0XFF4C5157)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                10.verticalSpace,

                // Conditionally set the height of the container for the selected screen
                SizedBox(
                  width: 390.w,
                  height: controller.reportSelected == 0
                      ? 390.h
                      : 420.h, // Adjust height based on the selected report
                  child: _getSelectedScreen(),
                ),
                10.verticalSpace,
                myAnalyticsDetailCard(
                  "assets/svg/Group 1107.svg",
                  "Total Bookings",
                  "265",
                ),
                6.verticalSpace,
                myAnalyticsDetailCard(
                  "assets/svg/Icon metro-coins (1).svg",
                  "Total Earnings",
                  "\$15,658.36",
                ),
                6.verticalSpace,
                myAnalyticsDetailCard(
                  "assets/svg/Group 1248.svg",
                  "Last 30 days",
                  "\$2,365.33",
                ),
                6.verticalSpace,
                myAnalyticsDetailCard(
                  "assets/svg/Mask Group 136.svg",
                  "Profile Visits",
                  "401",
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myAnalyticsDetailCard(
  String imagePath,
  String firstText,
  String secondText,
) {
  return SizedBox(
    width: 390.w,
    child: Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(color: Color(0xff1213141A)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 19.w,
              height: 19.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 120.w,
              child: Text(firstText,
                  style: AppTextStyle.button(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start),
            ),
            SizedBox(
              width: 120.w,
              child: Text(
                secondText,
                style: AppTextStyle.button(
                  color: const Color(0xff48576E),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
