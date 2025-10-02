import 'package:flutter/material.dart';
import 'package:winner_trains_app/resources/extensions/context_extension.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_issue_widget.dart';

class CancelReason extends StatelessWidget {
  const CancelReason({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        title: 'Cancel Reason',
      ),
      body: IssueWidget(
          reasons: [
            "Scheduling conflict",
            "No longer needed",
            "Personal emergency",
            "Technical issues"
          ],
          title: 'Select Reason',
          buttonText: 'Submit',
          activeRadioColor: context.secondary,
          onTap: () {
            Navigator.pushNamed(context, RoutesName.successAppointmentCancel);
          }),
    ));
  }
}
