import 'package:flutter_svg/svg.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/custom_dialogbox.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';

void logoutDialog(BuildContext context) {
  showCustomDialog(
    context: context,
    iconPath: "assets/svg/Group 15615 (5).svg",
    title: "Logout!",
    description: "Are you sure you want to logout?",
    buttonText: "Logout",
    secondaryButtonText: "Cancel",
    onPressed: () {
      Navigator.pop(context);

      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.selectUser, (r) => false);
      print("Post Deleted");
    },
    onPressed1: () {
      Navigator.pop(context);
      Navigator.pop(context);

      print("Cancelled");
    },
  );
}
