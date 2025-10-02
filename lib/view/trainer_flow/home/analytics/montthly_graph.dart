import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/analytics_view_model.dart'; // Import your view model

class Monthlygraph extends StatelessWidget {
  const Monthlygraph({super.key});

  @override
  Widget build(BuildContext context) {
    // Access AnalyticsViewModel using Provider
    final controller = Provider.of<AnalyticsViewModel>(context);

    // Monthly data for different months
    final List<List<_ChartData>> monthlyData = [
      [
        _ChartData('Week 1', 10),
        _ChartData('Week 2', 20),
        _ChartData('Week 3', 15),
        _ChartData('Week 4', 25),
      ],
      [
        _ChartData('Week 1', 30),
        _ChartData('Week 2', 40),
        _ChartData('Week 3', 35),
        _ChartData('Week 4', 50),
      ],
      [
        _ChartData('Week 1', 25),
        _ChartData('Week 2', 28),
        _ChartData('Week 3', 32),
        _ChartData('Week 4', 45),
      ],
    ];

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
            // Custom chart title with arrows to switch months
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: controller.goToPreviousMonth, // Using controller's method to go to previous month
                    icon: Icon(Icons.arrow_back_ios, size: 18.sp,
                    color: Color(0xff000000),),
                  ),
                  Text(
                    controller.months[controller.currentMonthIndex], // Display current selected month
                    style: AppTextStyle.button(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: controller.goToNextMonth, // Using controller's method to go to next month
                    icon: Icon(Icons.arrow_forward_ios, size: 18.sp,
                    color: Color(0xff000000),),
                  ),
                ],
              ),
            ),
        
     
           

            SizedBox(
  height: 350.h,
  child: SfCartesianChart(
    backgroundColor: Colors.transparent,
    plotAreaBackgroundColor: Colors.transparent,
    borderWidth: 0,
    borderColor: Colors.transparent,
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
      SplineAreaSeries<_ChartData, String>(
        dataSource: monthlyData[controller.currentMonthIndex],
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
