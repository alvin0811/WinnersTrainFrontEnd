import 'package:flutter/material.dart';

class AppointmentCardViewModel extends ChangeNotifier {
  int reportSelected = 0; 

  List<String> reportFilters = ["Upcoming", "Ongoing","Past",];
    void selectReportSelected(int index) {
    reportSelected = index;
    notifyListeners();
  }
}
