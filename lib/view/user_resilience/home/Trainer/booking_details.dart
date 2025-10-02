import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/booking_card.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/success_schedule_appointment.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: 'Booking Schedule Details',
            ),
            body: Column(
              children: [
                const BookingCard(),
                const Spacer(),
                const CustomButton(text: 'Proceed').inkWell(onTap: () {
                  G().paymentConfirmation =
                      PaymentConfirmation.fromappointments;
                  Navigator.pushNamed(
                    context,
                    RoutesName.paymentMethod,
                  );
                })
              ],
            ).paddingSymmetric(horizontal: 20.w, vertical: 20.h)));
  }
}
