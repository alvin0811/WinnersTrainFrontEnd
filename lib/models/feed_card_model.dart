class FeedCardModel {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final String? description;
  final bool isVideo;
  final bool isDescription;
  final String? videoUrl;
  final String profilePicUrl;
  final bool isimage;
  FeedCardModel({
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.description,
    required this.isVideo,
    this.videoUrl,
    required this.profilePicUrl,
    required this.isimage,
    required this.isDescription,
  });
}
