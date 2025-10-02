import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FeedbackProvider with ChangeNotifier {
  final List<File> _images = [];
  List<File> get images => List.unmodifiable(_images);
  Future<void> pickImages() async {
    if (_images.length < 5) {
      final ImagePicker picker = ImagePicker();
      final List<XFile>? pickedFiles = await picker.pickMultiImage();

      if (pickedFiles != null) {
        for (var file in pickedFiles) {
          if (_images.length < 5) {
            _images.add(File(file.path));
          } else {
            break;
          }
        }
        notifyListeners();
      }
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < _images.length) {
      _images.removeAt(index);
      notifyListeners();
    }
  }
}
