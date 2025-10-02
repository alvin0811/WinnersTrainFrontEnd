import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/booking_schedule_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class RescheduleBooking extends StatelessWidget {
  const RescheduleBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(
        title: 'Booking Reschedule',
      ),
      body: BookingScheduleCard(
          button: CustomButton(text: 'Reschedule').inkWell(
              onTap: () => Navigator.pushNamed(
                  context, RoutesName.rescheduleBookingDetails))),
    ));
  }
}
