import 'package:flutter/material.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/completed_appointments.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';

class SuccessReview extends StatelessWidget {
  const SuccessReview({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppPermissions(
        buttonText: 'Go Back',
        bodyText: 'Your review has been submitted!',
        onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const CompletedAppointments(isReviewed: true),
              ),
            ));
  }
}
