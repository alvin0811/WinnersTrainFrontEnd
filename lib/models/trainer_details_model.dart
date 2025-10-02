class TrainerDetailsModel {
  final String imageUrl;
  final String name;
  final String age;
  final String experience;
  final String gender;
  final String city;
  final String consultingFee;
  final String ratings;
  final bool isSaved;
  TrainerDetailsModel(
      {required this.imageUrl,
      required this.name,
      required this.age,
      required this.experience,
      required this.gender,
      required this.city,
      required this.consultingFee,
      required this.ratings,
      required this.isSaved});
}
