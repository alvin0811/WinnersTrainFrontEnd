import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/custom_dialogbox.dart';
import 'package:winner_trains_app/view/widgets/trainer/custom_dailog_box.dart';

void deleteAccountDialog(BuildContext context) {
  showCustomDialog(
    context: context,
    iconPath: "assets/svg/Group 15615 (4).svg",
    title: "Delete Account!",
    description: "Are you sure you want to delete\naccount?",
    buttonText: "No",
    secondaryButtonText: "Yes, Delete",
    onPressed: () {
      Navigator.pop(context);
      print("Post Deleted");
    },
    onPressed1: () {
      Navigator.pop(context);
      Navigator.pushNamed(context, RoutesName.selectUser);

      print("Cancelled");
    },
  );
}
