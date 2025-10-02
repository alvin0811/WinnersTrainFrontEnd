import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';

class HelpAndFeedbackViewModel extends ChangeNotifier {
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  List<File> get images => _images;

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
        notifyListeners();
      }
    } catch (e) {
      log("Error picking image: $e");
    }
  }

  void removeImage(File img) {
    images.remove(img);
    notifyListeners();
  }

  @override
  void dispose() {
    _images.clear();
    super.dispose();
  }
}
