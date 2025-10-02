import 'package:flutter/material.dart';
import 'package:winner_trains_app/resources/extensions/context_extension.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/custom_issue_widget.dart';

class UserReportPostIssue extends StatelessWidget {
//  final Color? radioColor;
  const UserReportPostIssue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: 'Report Issue',
          fontsize: 16,
        ),
        body: IssueWidget(
            reasons: [
              "Inappropriate content",
              "Spam or misleading",
              "Offensive language",
              "Privacy violation",
              "Irrelevant to resilience"
            ],
            onTap: () => Navigator.pushNamed(context, RoutesName.successReport),
            buttonText: 'Submit',
            activeRadioColor: context.secondary),
      ),
    );
  }
}
