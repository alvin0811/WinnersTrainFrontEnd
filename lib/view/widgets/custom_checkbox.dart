import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final Color? activeColor;
  final Color? CheckColor;
  final Color? stateColor;
  final Color? uncheckColor;
  final ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);
  CustomCheckbox(
      {super.key,
      this.activeColor,
      this.CheckColor,
      this.stateColor,
      this.uncheckColor});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isSelected,
      builder: (_, value, __) {
        return Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return stateColor ?? Colors.green; // Color when checked
            }
            return uncheckColor ?? Colors.grey; // Default color when unchecked
          }),
          value: value,
          onChanged: (newValue) {
            isSelected.value = newValue ?? false; // Toggle the checkbox state
          },
          activeColor:
              activeColor ?? Colors.green, // Color when checkbox is selected
          checkColor: CheckColor ?? Colors.white, // Color of the check mark
          materialTapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // Shrink the tap area
        );
      },
    );
  }
}
