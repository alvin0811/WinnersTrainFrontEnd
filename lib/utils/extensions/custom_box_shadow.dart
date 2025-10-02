import 'package:winner_trains_app/utils/basic_exports.dart';

extension CustomShadows on BoxShadow {
  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 10.r,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ];
  static List<BoxShadow> get customShadow => [
        BoxShadow(
          color: AppColor.dropShadow,
          blurRadius: 10.r,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ];
  static BoxShadow get onSecondaryBoxShadow => BoxShadow(
      color: Color(0xff008B8826).withOpacity(0.1),
      blurRadius: 12.r,
      offset: Offset(0, 12));
}
