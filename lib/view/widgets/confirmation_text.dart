

import 'package:winner_trains_app/utils/basic_exports.dart';

class ConfirmationText extends StatelessWidget {
  final String text;
  final String confirmationText;
  const ConfirmationText({super.key, required this.text, required this.confirmationText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: context.bodySmall),
        5.w.horizontalSpace,
        Text(
         confirmationText,
          style: context.bodySmall.copyWith(
              color: Color(0xff48576E),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff48576E),
              decorationThickness: 2),
        ),
      ],
    );
  }
}
