import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/analytics_view_model.dart';

class Yearlygraph extends StatelessWidget {
  final List<_ChartData> data = [
    _ChartData('Jan', 200),
    _ChartData('Feb', 240),
    _ChartData('Mar', 220),
    _ChartData('Apr', 260),
    _ChartData('May', 280),
    _ChartData('Jun', 250),
    _ChartData('Jul', 300),
    _ChartData('Aug', 270),
    _ChartData('Sep', 310),
    _ChartData('Oct', 330),
    _ChartData('Nov', 290),
    _ChartData('Dec', 320),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnalyticsViewModel>(context);

    return SizedBox(
      width: 390.w,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r), // Rounded corners
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: controller.goToPreviousYear,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18.sp,
                      color: const Color(0xff000000),
                    ),
                  ),
                  Text(
                    controller.years[controller.currentYearIndex],
                     style: AppTextStyle.button(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: controller.goToNextYear,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: const Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),

            /// Chart Display
            SizedBox(
              height: 350.h,
              child: SfCartesianChart(
                backgroundColor: Colors.transparent,
                plotAreaBackgroundColor: Colors.transparent,
                borderWidth: 0,
                borderColor: Colors.transparent,
                plotAreaBorderWidth: 0,
                plotAreaBorderColor: Colors.transparent,
                primaryXAxis: const CategoryAxis(
                  axisLine: AxisLine(width: 0),
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(size: 0),
                ),
                primaryYAxis: const NumericAxis(
                  axisLine: AxisLine(width: 0),
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(size: 0),
                ),
                series: <CartesianSeries>[
                  SplineAreaSeries<_ChartData, String>(
                    dataSource: data, 
                    xValueMapper: (_ChartData sales, _) => sales.day,
                    yValueMapper: (_ChartData sales, _) => sales.value,
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

class _ChartData {
  _ChartData(this.day, this.value);
  final String day;
  final double value;
}
