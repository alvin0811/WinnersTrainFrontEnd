import 'package:flutter/material.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';

class SuccessPostEdit extends StatelessWidget {
  const SuccessPostEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppPermissions(
        buttonText: 'Go Back',
        bodyText: 'Your Post has been Edited!',
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
         
        });
  }
}
