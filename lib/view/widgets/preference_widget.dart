import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_border.dart';


class PreferenceCard extends StatefulWidget {
  final List<String> preferencesOptions;
  final double? spacing;
  final double? fontSize;
  final double? runSpacing;
  final double? horizontalpaddding;
  final Gradient? gradient;

  const PreferenceCard(
      {super.key,
      required this.preferencesOptions,
      this.spacing,
      this.runSpacing,
      this.horizontalpaddding,
      this.gradient,
      this.fontSize});

  @override
  State<PreferenceCard> createState() => _PreferenceCardState();
}

class _PreferenceCardState extends State<PreferenceCard> {
  final ValueNotifier<int?> selectedIndex = ValueNotifier<int?>(null);

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: selectedIndex,
      builder: (context, selectedIdx, _) {
        return Wrap(
          spacing: widget.spacing ?? 20.w,
          runSpacing: widget.runSpacing ?? 20.h,
          children: List.generate(widget.preferencesOptions.length, (index) {
            bool isSelected = selectedIdx == index;

            return GestureDetector(
              onTap: () {
                selectedIndex.value = index;
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.horizontalpaddding ?? 20.w,
                    vertical: 10.h),
                decoration: BoxDecoration(
                    boxShadow: [
                      if (isSelected)
                        BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            blurRadius: 15.r,
                            offset: Offset(0, 6))
                    ],
                    borderRadius:
                        BorderRadius.circular(isSelected ? 28.r : 22.r),
                    border: CustomBorder.dynamicBorder(
                        width: isSelected ? 2 : 1,
                        color:
                            isSelected ? context.primary : Color(0xffB3BDCC)),
                    color: isSelected ? null : context.primary,
                    gradient: isSelected ? widget.gradient : null),
                child: Text(
                  widget.preferencesOptions[index],
                  style: context.titleMedium.copyWith(
                      fontSize: widget.fontSize ?? 16.sp,
                      color:
                          isSelected ? context.primary : context.onSecondary),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
