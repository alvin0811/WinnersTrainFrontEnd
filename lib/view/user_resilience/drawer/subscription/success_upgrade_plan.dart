import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';

class SuccessUpgradePlan extends StatelessWidget {
  final bool isFromDrawer;
  const SuccessUpgradePlan({super.key, this.isFromDrawer = false});

  @override
  Widget build(BuildContext context) {
    return CustomAppPermissions(
        buttonText: 'Continue',
        bodyText: 'Your plan has been upgraded successfully!',
        onTap: () {
          isFromDrawer == true
              ? Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.homeScreen,
                  (route) => false,
                )
              : Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName.liveSession,
                  (route) => false,
                );
        });
  }
}
