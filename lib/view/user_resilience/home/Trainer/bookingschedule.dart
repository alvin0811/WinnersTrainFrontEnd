import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/booking_schedule_card.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';


class Bookingschedule extends StatelessWidget {
  const Bookingschedule({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Booking Schedule',
            ),
            body:BookingScheduleCard(
              button:  CustomButton(text: 'Book Now').inkWell(
           onTap: () =>
             Navigator.pushNamed(context, RoutesName.boookingScheduleDetails)),)));
  }
}
