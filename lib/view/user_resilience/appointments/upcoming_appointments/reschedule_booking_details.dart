
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/booking_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class RescheduleBookingDetails extends StatelessWidget {
  const RescheduleBookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Reschedule Booking Details',
            ),
            body: Column(
              children: [
                BookingCard(),
                Spacer(),
                CustomButton(text: 'Proceed').inkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.successRescheduleAppointment))
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
