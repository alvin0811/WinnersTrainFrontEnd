import 'package:winner_trains_app/utils/basic_exports.dart';

class CommunityViewModel extends ChangeNotifier {
  List<String> items = [
    "Joined",
    "Discover",
  ];
  ValueNotifier<String> selectedItem = ValueNotifier("Joined");

  // void setSelectedItem(String newVal) {
  //   selectedItem.value = newVal;
  //   notifyListeners();
  // }
// In CommunityViewModel
  bool _about = false;

  bool get about => _about;
  

  void toggleAbout() {
    _about = !_about;
    notifyListeners();
  }

 set about(bool val) {
    _about = val;
    notifyListeners();
  }
}
