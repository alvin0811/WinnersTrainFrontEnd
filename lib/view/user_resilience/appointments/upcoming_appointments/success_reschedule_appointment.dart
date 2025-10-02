import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';

class SuccessRescheduleAppointment extends StatelessWidget {
  const SuccessRescheduleAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarVM = Provider.of<UserHomeViewModel>(context);
    return CustomAppPermissions(
        buttonText: 'Back to home',
        bodyText:
            'Your appointment with Dr. Lucas Henry \nis reschedule for June 28, 2025, at \n10:00 AM.',
        onTap: () {
          navBarVM.index = 0;

          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.homeScreen, (r) => false);
        });
  }
}
