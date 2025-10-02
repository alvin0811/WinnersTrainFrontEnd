import 'package:winner_trains_app/utils/app_enums.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';


class SuccessScheduleAppointment extends StatelessWidget {
  const SuccessScheduleAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navBarVM = Provider.of<UserHomeViewModel>(context);
    return CustomAppPermissions(
        buttonText: 'Back to home',
        bodyText: (G().paymentConfirmation == PaymentConfirmation.fromappointments)
            ? 'Your appointment request has been sent \nSuccessfully.'
            : 'Your plan has been upgraded successfully!',
        onTap: () {
          navBarVM.index = 0;

          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.homeScreen, (r) => false);
        });
  }
}
