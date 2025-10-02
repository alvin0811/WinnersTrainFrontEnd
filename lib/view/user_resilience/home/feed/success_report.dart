import 'package:flutter/material.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';

class SuccessReport extends StatelessWidget {
  const SuccessReport({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppPermissions(
        titletext: 'Report Issue!',
        buttonText: 'Go Back',
        bodyText: 'Your report has been submitted successfully!',
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }
}
