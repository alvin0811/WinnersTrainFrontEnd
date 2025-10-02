import 'package:winner_trains_app/utils/basic_exports.dart';

class AuthViewmodel extends ChangeNotifier {
  //password visibility
  bool showpassword = false;
  passwordvisibility() {
    showpassword = !showpassword;
    notifyListeners();
  }
}
