import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:winner_trains_app/resources/extensions/context_extension.dart';
import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/viewModel/competencies_view_model.dart';

class DualToggleWidget extends StatelessWidget {
  final String question;
    final AlignmentGeometry? alignment;
  final List<String> options; // 👈 now supports ANY number of options
  final Function(String) onChanged;
  final bool isSingleColumn; // 👈 control single column vs 2 per row

  const DualToggleWidget({
    super.key,
    required this.question,
    required this.options,
    required this.onChanged,
    this.isSingleColumn = false, this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CompetenciesViewModel>();

    Widget buildToggle(String label) {
      final isSelected = vm.selectedDualOption == label;

      final child = GestureDetector(
        onTap: () {
          vm.selectDualOption(label);
          onChanged(label);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
          margin: EdgeInsets.only(bottom: 10.h),
          alignment: alignment?? Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFCEB3),
                      Color(0xFF0AB2AE),
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(26.r),
            border: Border.all(
              color: isSelected ? Colors.transparent : const Color(0xff0AB2AE),
            ),
            color: isSelected ? null : Colors.white,
          ),
          child: Text(
            label,
            style: context.bodySmall.copyWith(
              color: isSelected ? Colors.white : const Color(0xff4C5157),
              fontSize: 14.sp,
            ),
          ),
        ),
      );

      return isSingleColumn ? child : Expanded(child: child);
    }

    /// Layout builder:
    /// - Single column → each option in its own row
    /// - Default → 2 per row
    List<Widget> buildRows() {
      if (isSingleColumn) {
        return options
            .map((opt) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: buildToggle(opt),
                ))
            .toList();
      } else {
        List<Widget> rows = [];
        for (int i = 0; i < options.length; i += 2) {
          final rowChildren = <Widget>[
            buildToggle(options[i]),
          ];
          if (i + 1 < options.length) {
            rowChildren.add(10.w.horizontalSpace);
            rowChildren.add(buildToggle(options[i + 1]));
          }
          rows.add(Row(children: rowChildren));
          rows.add(15.h.verticalSpace);
        }
        return rows;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.h.verticalSpace,
        Text(
          question,
          style: context.bodyMedium.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff121314),
          ),
        ),
        25.h.verticalSpace,
        ...buildRows(),
      ],
    );
  }
}
