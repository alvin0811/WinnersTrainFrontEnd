import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final TextEditingController controller;

  const CustomDatePicker({
    Key? key,
    required this.initialDate,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> selectedDate = ValueNotifier(initialDate);
    final ValueNotifier<DateTime> focusedDay = ValueNotifier(initialDate);

    return Dialog(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: 390.w,
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
                    padding: EdgeInsets.only(left: 130.w),
                    child: Text('Select Date',
                        style:
                            AppTextStyle.button(fontWeight: FontWeight.w400)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.edit_calendar,
                              color: Colors.black),
                          onPressed: () async {
                            final manualDate = await showDialog<String>(
                              context: context,
                              builder: (ctx) {
                                final manualController =
                                    TextEditingController();
                                return AlertDialog(
                                  title: const Text('Enter Date (yyyy-MM-dd)'),
                                  content: TextField(
                                    controller: manualController,
                                    keyboardType: TextInputType.datetime,
                                    decoration: const InputDecoration(
                                      hintText: 'yyyy-MM-dd',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(
                                          ctx,
                                          manualController.text,
                                        );
                                      },
                                      child: const Text('Set'),
                                    ),
                                  ],
                                );
                              },
                            );

                            if (manualDate != null && manualDate.isNotEmpty) {
                              try {
                                final parsed = DateFormat(
                                  'yyyy-MM-dd',
                                ).parseStrict(manualDate);
                                if (parsed.isAfter(DateTime.now())) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Future date not allowed'),
                                    ),
                                  );
                                } else {
                                  selectedDate.value = parsed;
                                  focusedDay.value = parsed;
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Invalid date format'),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
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
                    decoration: const BoxDecoration(color: Color(0XFF008B88)),
                    titleCentered: true,
                    titleTextStyle: AppTextStyle.button(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    leftChevronIcon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  rowHeight: 43.h,
                  daysOfWeekHeight: 30.h,
                  firstDay: DateTime(1930),
                  lastDay: DateTime.now(),
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
                    defaultTextStyle: AppTextStyle.button(
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    weekendTextStyle: AppTextStyle.button(
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    todayTextStyle: AppTextStyle.button(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    selectedTextStyle: AppTextStyle.button(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    todayDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFFCEB3), Color(0xFF0AB2AE)],
                      ),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFFCEB3), Color(0xFF0AB2AE)],
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: AppTextStyle.button(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    weekdayStyle: AppTextStyle.button(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  calendarBuilders: CalendarBuilders(
                    outsideBuilder: (context, day, focusedDay) => Container(),
                  ),
                );
              },
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: 350.w,
              child: CustomButton(
                buttonText: "Apply",
                onPressed: () {
                  controller.text = DateFormat(
                    'yyyy-MM-dd',
                  ).format(selectedDate.value);
                  Navigator.pop(context);
                },
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
