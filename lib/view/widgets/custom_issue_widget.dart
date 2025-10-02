import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';
import 'package:winner_trains_app/view/widgets/custom_button.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

class IssueWidget extends StatelessWidget {
  final String? buttonText;
  final List<String> reasons;
  final String? title;
  final VoidCallback onTap;
  final Color? activeRadioColor;
  IssueWidget(
      {this.buttonText,
     required this.reasons,
      this.title,
      required this.onTap,
      this.activeRadioColor});

  final ValueNotifier<int?> selectedReasonIndex = ValueNotifier<int?>(null);

  final ValueNotifier<String> otherReason = ValueNotifier<String>("");
  // final List<String> reasons = [
  //   "Inappropriate content",
  //   "Spam or misleading",
  //   "Offensive language",
  //   "Privacy violation",
  //   "Irrelevant to resilience"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? "Report Issues Reasons", style: context.labelLarge)
              .paddingSymmetric(horizontal: 20.w),
          SizedBox(height: 15.h),
          ValueListenableBuilder<int?>(
            valueListenable: selectedReasonIndex,
            builder: (context, selectedIndex, child) {
              return Column(
                children: [
                  ...List.generate(reasons.length, (index) {
                    return Column(
                      children: [
                        RadioListTile<int>(
                          activeColor: activeRadioColor ?? context.secondary,
                          title: Text(
                            reasons[index] ,
                            style: context.titleMedium.copyWith(
                              color: context.onPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          value: index,
                          groupValue: selectedIndex,
                          onChanged: (value) {
                            selectedReasonIndex.value = value;
                          },
                        ),
                        if (index != reasons.length)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 8.h),
                            child:
                                Divider(height: 1, color: Colors.grey.shade300),
                          ),
                      ],
                    );
                  }),
                  RadioListTile<int>(
                    activeColor: activeRadioColor ?? context.secondary,
                    title: Text(
                      "Other",
                      style: context.titleMedium.copyWith(
                        color: context.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: reasons.length,
                    groupValue: selectedIndex,
                    onChanged: (value) {
                      selectedReasonIndex.value = value;
                    },
                  ),
                  if (selectedIndex == reasons.length)
                    ValueListenableBuilder<String>(
                      valueListenable: otherReason,
                      builder: (context, text, child) {
                        return CustomTextfield(
                          height: 199.h,
                          hintText: 'Type here...',
                          maxLines: 6,
                          radius: BorderRadius.circular(15.r),
                        ).paddingSymmetric(horizontal: 20.w);
                      },
                    ),
                ],
              );
            },
          ),
        ],
      ).paddingSymmetric(vertical: 20.h),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: CustomButton(
          text: buttonText,
        ).inkWell(onTap: onTap).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
