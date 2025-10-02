import 'package:flutter/material.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';
import 'package:winner_trains_app/view/widgets/others_custom_widget.dart';

class SettingTermsCondition extends StatelessWidget {
  const SettingTermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            title: 'Terms & Conditions',
          ),
          body: OthersCustomWidget()),
    );
  }
}
