import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_log.dart';
import 'package:winner_trains_app/view/user_resilience/survey/survey_page1.dart';

class UserHomeViewModel extends ChangeNotifier {
  // int _bottomNavIndex = 0;
  // // final scaffoldKey = GlobalKey<ScaffoldState>();
  // int get bottomNavIndex => _bottomNavIndex;

  // set bottomNavIndex(int index) {
  //   "CHangeing index to $index".print();
  //   _bottomNavIndex = index;
  //   notifyListeners();
  // }

  // String get currentAppBarTitle {
  //   return ['Home', 'Communities', 'Survey', 'Appointments'];
  // }

  // Widget getCurrentScreen() {
  //   return [
  //     HomeFragmentScreen(),
  //     CommunitiesPage(),
  //     SurveyPage(),
  //     AppointmentsPage(),
  //   ][_bottomNavIndex];
  // }

  final c = TextEditingController();
  void openDrawer() {}
  // void openDrawer() => scaffoldKey.currentState?.openDrawer();
  void closeDrawer() {
    // scaffoldKey.currentState!.openEndDrawer();
  }
   int _index = 0;
  int get index => _index;
 
  set index(int index) {
    "CHangeing index to $index".print();
    _index = index;
    notifyListeners();
  }
  final List<Widget> _pages = [
    HomeFragmentScreen(),
      CommunitiesPage(),
      SurveyPage1(),
      AppointmentsPage(),
  ];
  List<Widget> get pages => _pages;

  void updateIndex(int index) {
    _index = index;
    notifyListeners(); // Notify the UI to update
  }
}
