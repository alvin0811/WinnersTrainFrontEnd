import 'package:flutter/material.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/appointments.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/communites.dart';
import 'package:winner_trains_app/view/trainer_flow/home/home.dart';

import 'package:winner_trains_app/view/trainer_flow/home/profile/profile.dart';

class TrainerMainHomeViewModel extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  final List<Widget> _pages = [
    Home(),
    Communites(),
    Appointments(),
    Profile(),
  ];
  List<Widget> get pages => _pages;

  void updateIndex(int index) {
    _index = index;
    notifyListeners(); // Notify the UI to update
  }
  // Function to change selected tab
}
