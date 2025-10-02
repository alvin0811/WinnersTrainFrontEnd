import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/analytics_view_model.dart';

class WeeklyGraph extends StatelessWidget {
  const WeeklyGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnalyticsViewModel>(context);

    return SizedBox(
      width: 390.w,
      height: 350.h,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r), // Rounded corners
        ),
        child: Column(
          children: [
            // Week title and navigation buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: controller.goToPreviousWeek,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18.sp,
                    ),
                    color: Color(0xff000000),
                  ),
                  Text(
                    controller.weeks[controller.currentWeekIndex],
                    style: AppTextStyle.button(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: controller.goToNextWeek,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),

            // Chart
            //         SizedBox(
            //           height: 270.h, // Adjust height for the chart within the card
            //           child: SfCartesianChart(
            //              backgroundColor: Colors.transparent,
            // plotAreaBackgroundColor: Colors.transparent,
            //             primaryXAxis: CategoryAxis(),
            //             series: <CartesianSeries>[

            //               SplineAreaSeries<ChartData, String>(
            //                 dataSource:
            //                     controller.weeklyData[controller.currentWeekIndex],
            //                 xValueMapper: (ChartData data, _) => data.day,
            //                 yValueMapper: (ChartData data, _) => data.value,
            //                 gradient: const LinearGradient(
            //                   colors: [Color(0xFF008B88), Color(0xFFE2CFCF)],
            //                 ),
            //                 dataLabelSettings: const DataLabelSettings(isVisible: true),
            //               ),
            //             ],
            //           ),
            //         ),
            SizedBox(
              height: 270.h,
              child: SfCartesianChart(
                backgroundColor: Colors.transparent,
                plotAreaBackgroundColor: Colors.transparent,

                borderWidth: 0,
                borderColor: Colors.transparent,

                // ✅ These two lines are crucial to remove the black border
                plotAreaBorderWidth: 0,
                plotAreaBorderColor: Colors.transparent,

                primaryXAxis: CategoryAxis(
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                ),
                primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                ),

                series: <CartesianSeries>[
                  SplineAreaSeries<ChartData, String>(
                    dataSource:
                        controller.weeklyData[controller.currentWeekIndex],
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.value,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF008B88), Color(0xFFE2CFCF)],
                    ),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.day, this.value);
  final String day;
  final double value;
}
