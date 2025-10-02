import 'package:winner_trains_app/utils/app_colors.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/viewModel/competencies_view_model.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/competencies_view.dart';
import 'package:winner_trains_app/view/widgets/custom_textfield.dart';

enum ToggleLayout { twoPerRow, onePerRow }

class ToggleOptionsWidget extends StatelessWidget {
  final String question;
  final bool? isDivider;
  final double? horizomtalPadding;
  final String? hintText;
  final List<String> options;
  final AlignmentGeometry? alignment;
  final Function(String, String?) onChanged;
  final ToggleLayout layout; // ✅ new param

  const ToggleOptionsWidget({
    super.key,
    required this.question,
    required this.options,
    required this.onChanged,
    this.layout = ToggleLayout.twoPerRow,
    this.alignment,
    this.isDivider,
    this.hintText, this.horizomtalPadding, // default
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CompetenciesViewModel>();
    final otherController = TextEditingController(text: vm.otherText);

    // ✅ Build rows based on layout type
    final rows = <Widget>[];
    if (layout == ToggleLayout.onePerRow) {
      for (final option in options) {
        rows.add(_buildOption(context, vm, option, isExpanded: true));
        rows.add(10.h.verticalSpace);
      }
    } else {
      // two per row
      for (int i = 0; i < options.length; i += 2) {
        final first = options[i];
        final second = i + 1 < options.length ? options[i + 1] : null;

        rows.add(Row(
          children: [
            Expanded(child: _buildOption(context, vm, first)),
            if (second != null) ...[
              10.w.horizontalSpace,
              Expanded(child: _buildOption(context, vm, second)),
            ]
          ],
        ));
        rows.add(10.h.verticalSpace);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: context.bodyMedium.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff121314)),
        ),
        25.h.verticalSpace,
        ...rows,
        if (vm.selectedOption == "Other") ...[
          20.h.verticalSpace,
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextfield(
                    maxLines: 7,
                    shadow: false,
                    height: 200.h,
                    hintColor: Color(0xff9BA8BB),
                    controller: otherController,
                    hintText: hintText ?? "Type here...",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Color(0xff0AB2AE))),
                    focusBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(color: Color(0xff0AB2AE))),
                    onChanged: (val, controller) {
                      // vm.selectOption("Other", val);
                      //  onChanged("Other", val);
                    },
                  ),
                  10.h.verticalSpace,
                  if (isDivider == true)
                    Divider(
                      color: Color(0xffDDE2E8),
                    ),
                ],
              ),
            ),
          ),
        ]
      ],
    );
  }

  Widget _buildOption(
      BuildContext context, CompetenciesViewModel vm, String option,
      {bool isExpanded = false}) {
    final isSelected = vm.selectedOption == option;

    return GestureDetector(
      onTap: () {
        vm.selectOption(option, null);
        onChanged(option, null);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        alignment: alignment ?? Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: horizomtalPadding?? 18.w, vertical: 10.h),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topCenter, // 180° = top → bottom
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFFFCEB3),
                    const Color(0xFF0AB2AE),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(
              color: isSelected ? Colors.transparent : const Color(0xff0AB2AE)),
          color: isSelected ? null : Colors.white,
        ),
        child: Text(
          option,
          style: context.bodySmall.copyWith(
            color: isSelected ? Colors.white : const Color(0xff4C5157),
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
