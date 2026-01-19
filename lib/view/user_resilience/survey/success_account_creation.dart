import 'package:flutter/material.dart';

import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';

class SuccessAccountCreation extends StatelessWidget {
  SuccessAccountCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomAppPermissions(
            buttonText: 'Continue',
            bodyText: 'Your account has been created \nsuccessfully!',
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.homeScreen, (r) => false)));
  }
}
