import 'package:table_calendar/table_calendar.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> selectedDate = ValueNotifier(initialDate);
    final ValueNotifier<DateTime> focusedDay = ValueNotifier(initialDate);

    return Dialog(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: 390.w,
        height: 509.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 150.w),
                    child: Text(
                      'Select Date',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: context.onPrimary),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: selectedDate,
                builder: (c, value, _) {
                  return TableCalendar(
                    headerStyle: HeaderStyle(
                      headerMargin: EdgeInsets.only(bottom: 15.h),
                      formatButtonVisible: false,
                      decoration: BoxDecoration(color: context.secondary),
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                          color: context.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      leftChevronIcon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: context.primary,
                        size: 20,
                      ),
                      rightChevronIcon: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: context.primary,
                        size: 20,
                      ),
                    ),
                    rowHeight: 43.h,
                    daysOfWeekHeight: 30.h,
                    firstDay: DateTime(2025),
                    lastDay: DateTime(2050),
                    focusedDay: focusedDay.value,
                    currentDay: value,
                    selectedDayPredicate: (day) => isSameDay(value, day),
                    onDaySelected: (selectedDay, newFocusedDay) {
                      selectedDate.value = selectedDay;
                      focusedDay.value = newFocusedDay;
                    },
                    daysOfWeekVisible: true,
                    calendarFormat: CalendarFormat.month,
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: context.onPrimary.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                      weekendTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: context.onPrimary.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                      ),
                      todayTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: context.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      selectedTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: context.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      todayDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFCEB3),
                            Color(0xFF0AB2AE),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFCEB3),
                            Color(0xFF0AB2AE),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.onPrimary,
                          fontSize: 16.sp),
                      weekdayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.onPrimary,
                          fontSize: 16.sp),
                    ),
                    calendarBuilders: CalendarBuilders(
                      outsideBuilder: (context, day, focusedDay) => Container(),
                    ),
                  );
                }),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: const CustomButton(
                text: 'Apply',
              ).inkWell(onTap: () {
                onDateSelected(selectedDate.value);
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    return [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ][month - 1];
  }
}
