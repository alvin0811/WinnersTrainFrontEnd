import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';
import 'package:winner_trains_app/utils/extensions/custom_box_shadow.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_date_picker.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class BookingScheduleCard extends StatefulWidget {
  final Widget? button;
  const BookingScheduleCard({super.key, required this.button});

  @override
  State<BookingScheduleCard> createState() => _BookingScheduleCardState();
}

class _BookingScheduleCardState extends State<BookingScheduleCard> {
  List<String> availableTimeSlot = [
    '09:00 AM to 10:00 AM',
    '11:00 AM to 12:00 PM',
    '01:00 PM to 02:00 PM',
    '03:00 PM to 04:00 PM',
    '05:00 PM to 06:00 PM',
    '07:00 PM to 08:00 PM',
    '09:00 PM to 10:00 PM',
    '11:00 PM to 12:00 AM'
  ];
  final ValueNotifier<int?> selectedIndex = ValueNotifier<int?>(null);

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Note',
          style: context.bodySmall,
        ),
        10.h.verticalSpace,
        CustomTextfield(
          hintText: 'Type Additional Note',
          maxLines: 6,
          height: 157.h,
          radius: BorderRadius.circular(15.r),
        ),
        10.h.verticalSpace,
        Text(
          'Date',
          style: context.bodySmall,
        ),
        CustomTextfield(
            hintText: 'Select Date',
            radius: BorderRadius.circular(28.r),
            suffixIcon: Icon(
              Icons.calendar_month,
              size: 24,
              color: Colors.black.withOpacity(0.6),
            ).inkWell(onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return CustomDatePicker(
                    initialDate: DateTime.now(),
                    onDateSelected: (date) {
                      print("Selected Date: $date");
                    },
                  );
                },
              );
            })),
        20.h.verticalSpace,
        Text('Available Time Slot',
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w600)),
        10.h.verticalSpace,
        Container(
          width: double.infinity,
          //  height: 214.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
              color: context.primary,
              borderRadius: BorderRadius.circular(10.r),
              border: CustomBorder.thin(color: context.outline),
              boxShadow: CustomShadows.customShadow),
          child: ValueListenableBuilder<int?>(
              valueListenable: selectedIndex,
              builder: (context, selectedIdx, _) {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: availableTimeSlot.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 13,
                            mainAxisSpacing: 14,
                            childAspectRatio: 4.3),
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIdx == index;
                      return GestureDetector(
                          onTap: () {
                            selectedIndex.value = index;
                          },
                          child: Container(
                              width: 169.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                        color: Colors.blue.withOpacity(0.2),
                                        blurRadius: 15.r,
                                        offset: Offset(0, 6))
                                ],
                                borderRadius: BorderRadius.circular(
                                    isSelected ? 18.r : 26.r),
                                border: CustomBorder.dynamicBorder(
                                    width: isSelected ? 0 : 1,
                                    color: isSelected
                                        ? Colors.transparent
                                        : Color(0xff0AB2AE)),
                                color: isSelected ? null : context.primary,
                                gradient: isSelected
                                    ? const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffE2CFCF),
                                          Color(0xff008B88),
                                        ],
                                      )
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  availableTimeSlot[index],
                                  style: context.titleMedium.copyWith(
                                      fontSize: 14.sp,
                                      color: isSelected
                                          ? context.primary
                                          : context.onPrimaryContainer),
                                ),
                              )));
                    });
              }),
        ),
        Spacer(),
        widget.button!
      ],
    ).paddingSymmetric(horizontal: 20.w, vertical: 20.h);
  }
}
