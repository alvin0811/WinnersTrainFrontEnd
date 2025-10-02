import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  const CustomDivider({
    super.key,
    this.color,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Colors.black.withOpacity(0.1),
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
