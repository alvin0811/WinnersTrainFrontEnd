import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/view/widgets/custom_app_permissions..dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';

class SuccessPostShared extends StatelessWidget {
  const SuccessPostShared({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<UserHomeViewModel>(context);
    return CustomAppPermissions(
        buttonText: 'Go Back',
        bodyText: 'Your Post has been Shared!',
        onTap: () {
          vm.c.clear();
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }
}
