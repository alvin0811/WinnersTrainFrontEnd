import 'package:flutter/material.dart';

class StoryViewModel with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  StoryViewModel() {
    _startLoading();
  }

  void _startLoading() async {
    await Future.delayed(Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }
}
