import 'package:flutter/material.dart';
import 'package:winner_trains_app/models/card_model.dart';

class CommunitesCardViewModel extends ChangeNotifier {
  int reportSelected = 0;
  List<String> reportFilters = ["Discover", "Joined", "Your"];
  List<CardDataModel> _discoverCards = [];
  List<CardDataModel> _joinedCards = [];
  List<CardDataModel> _yourCards = [];
  List<CardDataModel> get discoverCards => _discoverCards;
  List<CardDataModel> get joinedCards => _joinedCards;
  List<CardDataModel> get yourCards => _yourCards;
  void selectReportSelected(int index) {
    reportSelected = index;
    notifyListeners();
  }

  void initializeData() {
    _discoverCards = [
      CardDataModel(
        image: "assets/images/anxiety-related-community.png",
        title: "Stress-Related",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
      CardDataModel(
        image: "assets/images/anxiety2-community.png",
        title: "Depression",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
      CardDataModel(
        image: "assets/images/anxiety3-community.png",
        title: "Anxiety",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
      CardDataModel(
        image: "assets/images/stress-related3-community.png",
        title: "Stress-Related",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
      CardDataModel(
        image: "assets/images/stress-related-community.png",
        title: "Anxiety",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
      CardDataModel(
        image: "assets/images/stress-related2-community.png",
        title: "Stress-Related",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
    ];
    _joinedCards = [
      CardDataModel(
        image: "assets/images/stress-related3-community.png",
        title: "Stress-Related",
        subtext1: "Public",
        subtext2: "1.6M members",
      
      ),
      CardDataModel(
         image: "assets/images/stress-related2-community.png",
        title: "Anxiety",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
       CardDataModel(
         image: "assets/images/anxiety2-community.png",
        title: "Depression",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
    ];
    _yourCards = [
      CardDataModel(
           image: "assets/images/stress-related3-community.png",
        title: "Stress-Related",
        subtext1: "Public",
        subtext2: "1.6M members",
      
      ),
      CardDataModel(
          image: "assets/images/anxiety2-community.png",
        title: "Anxiety",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
       CardDataModel(
       image: "assets/images/stress-related2-community.png",
        title: "Depression",
        subtext1: "Public",
        subtext2: "1.6M members",
      ),
    ];
    notifyListeners();
  }
}
