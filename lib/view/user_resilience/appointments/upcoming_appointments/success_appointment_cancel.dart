import 'package:winner_trains_app/utils/basic_exports.dart';

import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';

class SuccessAppointmentCancel extends StatelessWidget {
  const SuccessAppointmentCancel({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarVM = Provider.of<UserHomeViewModel>(context);
    return CustomAppPermissions(
        buttonText: 'Go Back',
        bodyText: 'Your appointment has been cancelled \nsuccessfully!',
        onTap: () {
          navBarVM.index = 3;
          // Navigator.pushNamedAndRemoveUntil(
          //     context, RoutesName.homeScreen, (route) => false);

          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.homeScreen, (r) => false);
        });
  }
}
