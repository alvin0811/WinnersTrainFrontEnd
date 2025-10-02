import 'package:winner_trains_app/utils/basic_exports.dart';

class AppointmentViewModel extends ChangeNotifier {
  List<String> items = [
    "Upcoming",
    "Ongoing",
    "Past",
  ];
  ValueNotifier<String> selectedItem = ValueNotifier("Upcoming");


 
}
