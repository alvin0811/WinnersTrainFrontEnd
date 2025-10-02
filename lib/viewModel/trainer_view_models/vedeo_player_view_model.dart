import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerProvider with ChangeNotifier {
  late VideoPlayerController _controller;
  bool _isPlaying = true;
  bool _isInitialized = false;
  bool _isIconTapped = false;
  bool _isIconLike = true;

  bool get isIconTapped => _isIconTapped;
  bool get isIconLike => _isIconLike;
  VideoPlayerController get controller => _controller;
  bool get isPlaying => _isPlaying;
  bool get isInitialized => _isInitialized;

  Future<void> initialize(String url) async {
    _controller = VideoPlayerController.network(url);
    await _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    _isPlaying = true;
    _isInitialized = true;

    _controller.addListener(() {
      notifyListeners();
    });

    notifyListeners();
  }

  void togglePlayPause() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void toggleLikeIcon() {
    _isIconLike = !_isIconLike;
    notifyListeners();
  }

  void toggleIconColor() {
    _isIconTapped = !_isIconTapped;
    notifyListeners();
  }

  void disposeController() {
    _controller.dispose();
    _isInitialized = false;
    notifyListeners(); 
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
