import 'package:winner_trains_app/utils/basic_exports.dart';

class AppointmentModel {
  final String imageUrl;
  final String docName;
  final String buttonText;
  final Widget? button;
  final String time;
  final bool isPast;
  final bool isButton;

  AppointmentModel(
      {required this.imageUrl,
      required this.docName,
      this.button,
      required this.buttonText,
      this.isPast = false,
      this.isButton = true,
      required this.time});
}
