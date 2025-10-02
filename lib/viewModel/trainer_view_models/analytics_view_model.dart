import 'package:flutter/material.dart';
import 'package:winner_trains_app/view/trainer_flow/home/analytics/weekly_graph.dart'; // Use this

class AnalyticsViewModel extends ChangeNotifier {
  int reportSelected = 0;
  List<String> reportFilters = ["Weekly", "Monthly", "Yearly"];

  // Monthly graph
  int currentMonthIndex = 0;
  List<String> months = ['June', 'July', 'August'];

  void goToPreviousMonth() {
    if (currentMonthIndex > 0) {
      currentMonthIndex--;
      notifyListeners();
    }
  }

  void goToNextMonth() {
    if (currentMonthIndex < months.length - 1) {
      currentMonthIndex++;
      notifyListeners();
    }
  }

  // Yearly graph
  int currentYearIndex = 0;
  List<String> years = ['2022', '2023', '2024'];
  void goToPreviousYear() {
    if (currentYearIndex > 0) {
      currentYearIndex--;
      notifyListeners();
    }
  }

  void goToNextYear() {
    if (currentYearIndex < years.length - 1) {
      currentYearIndex++;
      notifyListeners();
    }
  }

  // Weekly graph
  int currentWeekIndex = 0;
  List<String> weeks = ['Week 1', 'Week 2', 'Week 3','Week 4'];

  List<List<ChartData>> weeklyData = [
    [
      ChartData('Mon', 5),
      ChartData('Tue', 10),
      ChartData('Wed', 7),
      ChartData('Thu', 12),
      ChartData('Fri', 9),
      ChartData('Sat', 14),
      ChartData('Sun', 6),
    ],
    [
      ChartData('Mon', 6),
      ChartData('Tue', 8),
      ChartData('Wed', 10),
      ChartData('Thu', 13),
      ChartData('Fri', 11),
      ChartData('Sat', 15),
      ChartData('Sun', 5),
    ],
    [
      ChartData('Mon', 7),
      ChartData('Tue', 12),
      ChartData('Wed', 9),
      ChartData('Thu', 14),
      ChartData('Fri', 13),
      ChartData('Sat', 16),
      ChartData('Sun', 7),
    ],
     [
      ChartData('Mon', 6),
      ChartData('Tue', 8),
      ChartData('Wed', 10),
      ChartData('Thu', 13),
      ChartData('Fri', 11),
      ChartData('Sat', 15),
      ChartData('Sun', 5),
    ],
  ];

  void goToPreviousWeek() {
    if (currentWeekIndex > 0) {
      currentWeekIndex--;
      notifyListeners();
    }
  }

  void goToNextWeek() {
    if (currentWeekIndex < weeks.length - 1) {
      currentWeekIndex++;
      notifyListeners();
    }
  }

  void selectReportSelected(int index) {
    reportSelected = index;
    notifyListeners();
  }
}
