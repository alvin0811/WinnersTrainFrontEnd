import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/time_box.dart';

class TimeSelectionRow extends StatelessWidget {
  final String day;
  final TimeSelection timeSelection;
  final VoidCallback? onRemove;

  const TimeSelectionRow({
    Key? key,
    required this.day,
    required this.timeSelection,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimeBox(
          controller: timeSelection.startTimeController,
          amPm: timeSelection.startAmPm,
          onTap: () => _selectTime(context, true, timeSelection),
        ),
        const Text(
          "To",
          style: TextStyle(
            color: Color(0xff48576E),
            fontSize: 16,
          ),
        ),
        TimeBox(
          controller: timeSelection.endTimeController,
          amPm: timeSelection.endAmPm,
          onTap: () => _selectTime(context, false, timeSelection),
        ),
        if (onRemove != null)
          IconButton(
            icon: const Icon(
              Icons.remove,
              color: Color(0xff48576E),
            ),
            onPressed: onRemove,
          ),
      ],
    );
  }
  // Future<void> _selectTime(BuildContext context, bool isStartTime) async {
  //   TimeOfDay? selectedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (selectedTime != null) {
  //     String formattedTime = selectedTime.format(context);
  //     if (isStartTime) {
  //       timeSelection.startTimeController.text = formattedTime;
  //       timeSelection.startAmPm =
  //           selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
  //     } else {
  //       timeSelection.endTimeController.text = formattedTime;
  //       timeSelection.endAmPm =
  //           selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
  //     }
  //   }
  // }

  Future<void> _selectTime(
    BuildContext context,
    bool isStartTime,
    TimeSelection timeSelection,
  ) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: AppColors.backgroundColor,
              hourMinuteTextColor: Colors.white,
              hourMinuteTextStyle: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              dayPeriodTextColor: Colors.white,
              dayPeriodShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.white),
              ),
              dialHandColor: const Color(0xff0DCBC6),
              dialTextColor: Colors.black,
              dialBackgroundColor: Colors.grey[100],
              entryModeIconColor: const Color(0xff0DCBC6),
              helpTextStyle: const TextStyle(
                color: Color(0xff0DCBC6),
              ),
              cancelButtonStyle: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xff0DCBC6),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white,),
              ),
              confirmButtonStyle: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xff0DCBC6),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xff0DCBC6),
              surface: Colors.grey,
              onPrimary: Colors.redAccent,
              onSurface: Colors.red,
              onBackground: Colors.grey,
              secondary: Color(0xff0DCBC6),
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xff0DCBC6),
              selectionColor: Color(0xff0DCBC6),
              selectionHandleColor: Color(0xff0DCBC6),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      String formattedTime = selectedTime.format(context);
      if (isStartTime) {
        timeSelection.startTimeController.text = formattedTime;
        timeSelection.startAmPm =
            selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
      } else {
        timeSelection.endTimeController.text = formattedTime;
        timeSelection.endAmPm =
            selectedTime.period == DayPeriod.am ? 'AM' : 'PM';
      }
    }
  }
}

class TimeSelection {
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  String startAmPm;
  String endAmPm;

  TimeSelection({
    required this.startTimeController,
    required this.endTimeController,
    required this.startAmPm,
    required this.endAmPm,
  });
}
