import 'package:flutter/material.dart';
import 'package:winner_trains_app/models/home_card_model.dart';

class HomeCardViewModel extends ChangeNotifier {
  final List<HomeCardModel> _items = [
    HomeCardModel(
    proimageUrl:"assets/images/123.png",
    title: "Alexander Benjamin",
    subtitle: "Jan 11, 2023",
    imageUrl: "assets/images/yoga-image.png",
    description: "This is a video description",
    isVideo: true,
    isImage: false,
    isMyPost: false, 
  ),
  HomeCardModel(
    proimageUrl:"assets/images/yoga-image.png",
    title: "Dr. Charlotte Lucas",
    subtitle: "Jan 12, 2023",
    imageUrl: "assets/images/123.png",
    description: "This is an image description",
    isVideo: false,
    isImage: false,
    isMyPost: true, 
  ),
     HomeCardModel(
      proimageUrl:"assets/images/321.png",
    title: "Alexander Benjamin",
    subtitle: "Jan 11, 2023",
    imageUrl: "assets/images/yoga-image.png",
    description: "This is a video description",
    isVideo: true,
    isImage: false,
    isMyPost: false, 
  ),
  HomeCardModel(
    proimageUrl:"assets/images/yoga-image.png",
    title: "Dr. Charlotte Lucas",
    subtitle: "Jan 12, 2023",
    imageUrl: "assets/images/321.png",
    description: "This is an image description",
    isVideo: false,
    isImage: true,
    isMyPost: true, 
  ),
  ];
  final List<ValueNotifier<bool>> _likes = List.generate(4, (_) => ValueNotifier(false));
  List<HomeCardModel> get items => _items;
  List<ValueNotifier<bool>> get likes => _likes;

  void toggleLike(int index) {
    _likes[index].value = !_likes[index].value;
    notifyListeners();  
  }
}
