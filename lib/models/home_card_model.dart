class HomeCardModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String proimageUrl;
  final String description;
  final bool isVideo;
  final bool isImage;
  final bool isMyPost;

  HomeCardModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.proimageUrl,
    required this.description,
    required this.isVideo,
    required this.isImage,
    required this.isMyPost,
  });
}
