class CardDataModel {
  final String image;
  final String title;
  final String? subtext1;
  final String? subtext2;

  CardDataModel({
    required this.image,
    required this.title,
    this.subtext1,
    this.subtext2,
  });
}
