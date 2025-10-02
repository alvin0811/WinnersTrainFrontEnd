import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/widgets/custom_dialogbox.dart';

void deleteDialogComment(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialogbox(
        onTapCancel: () {
          Navigator.pop(context);
        },
        onTapProceed: () => Navigator.pop(context),
        bodyText: 'Are you sure you want to delete this comment?',
      );
    },
  );
}
