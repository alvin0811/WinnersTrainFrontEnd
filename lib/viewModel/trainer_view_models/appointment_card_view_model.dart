import 'package:flutter/material.dart';

class AppointmentCardViewModel extends ChangeNotifier {
  List<String> items = [
    "Upcoming",
    "Ongoing",
    "Past",
  ];
  ValueNotifier<String> selectedItem = ValueNotifier("Upcoming");


 

}
