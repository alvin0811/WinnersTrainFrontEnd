import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/utils.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/time_salection_row.dart';

class AuthViewModel with ChangeNotifier {
  Map<String, List<TimeSelection>> dayCards = {
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
    'Saturday': [],
    'Sunday': [],
  };

  Map<String, bool> daySwitchState = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  void toggleDaySwitch(String day) {
    daySwitchState[day] = !(daySwitchState[day] ?? false);
    notifyListeners();
  }

  void addNewCard(String day, BuildContext context) {
    if ((dayCards[day]?.length ?? 0) >= 6) {
      Utils.errorSnack(
        context: context,
        message: 'You can only add up to 6 time slots.',
      );
      return;
    }

    dayCards[day]?.add(
      TimeSelection(
        startTimeController: TextEditingController(),
        endTimeController: TextEditingController(),
        startAmPm: '',
        endAmPm: '',
      ),
    );
    notifyListeners();
  }

  void removeCard(String day, int index) {
    dayCards[day]?.removeAt(index);
    notifyListeners();
  }

  void resetAll() {
    daySwitchState.clear();
    dayCards.clear();
    notifyListeners();
  }

  final List<String> defaultOptions = [
    'Depression',
    'Fear',
    'Anxiety',
    'Irritation',
    'Anger',
    'Sadness',
    'Envy',
    'Stress-Related',
    'Worry',
    'Motivation',
  ];

  List<String> options = [];
  List<String> selectedOptions = [];
  void selectOption(String option) {
    if (!selectedOptions.contains(option)) {
      selectedOptions.add(option);
      notifyListeners();
    }
  }

  void deselectOption(String option) {
    selectedOptions.remove(option);
    notifyListeners();
  }

  void addCustomOption(String newOption) {
    if (!options.contains(newOption)) {
      options.add(newOption);
      notifyListeners();
    }
  }

  void removeCustomOption(String option) {
    options.remove(option);
    selectedOptions.remove(option);
    notifyListeners();
  }
}
