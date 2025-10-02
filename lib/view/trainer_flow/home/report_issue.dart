import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';
import 'package:winner_trains_app/view/widgets/buttons/custom_button.dart';
import 'package:winner_trains_app/view/widgets/trainer/custominputfiled.dart';
import 'package:winner_trains_app/view/widgets/trainer/auth_widgets/thank_you)dialog.dart';
import 'package:winner_trains_app/view/widgets/trainer/main_home_app_bar.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class TrainerReportIssue extends StatefulWidget {
  const TrainerReportIssue({super.key});

  @override
  State<TrainerReportIssue> createState() => _TrainerReportIssueState();
}

class _TrainerReportIssueState extends State<TrainerReportIssue> {
  final ValueNotifier<String> selectedReason = ValueNotifier<String>("");

  final List<String> reasons = [
    "Inappropriate content",
    "Spam or misleading",
    "Offensive language",
    "Privacy violation",
    "Irrelevant to resilience",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    final bottomindex = Provider.of<TrainerMainHomeViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const MainHomeAppBar(
          title: "Report Issue",
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 20.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Reason", style: AppTextStyle.heading()),
                20.verticalSpace,
                ...reasons.asMap().entries.map(
                  (entry) {
                    final index = entry.key;
                    final reason = entry.value;
                    return ValueListenableBuilder<String>(
                      valueListenable: selectedReason,
                      builder: (context, value, _) {
                        return Column(
                          children: [
                            RadioListTile<String>(
                              contentPadding: EdgeInsets.zero,
                              value: reason,
                              groupValue: value,
                              activeColor: const Color(0xff0AB2AE),
                              title: Text(
                                reason,
                                style: AppTextStyle.button(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onChanged: (val) {
                                selectedReason.value = val!;
                              },
                            ),
                            if (index != reasons.length - 1)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 8.h),
                                child: Divider(
                                    height: 1, color: Colors.grey.shade300),
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ValueListenableBuilder<String>(
                  valueListenable: selectedReason,
                  builder: (context, value, _) {
                    if (value == "Other") {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.verticalSpace,
                          CustomInputWidget(
                            radius: 8,
                            maxline: 5,
                            Header: "",
                            hint: "Type here...",
                            label: "Type here...",
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: CustomButton(
            buttonText: "Submit",
            onPressed: () {
                            Navigator.pushNamed(context, RoutesName.trainerreportsubmittes);

            },
          ),
        ),
      ),
    );
  }
}
