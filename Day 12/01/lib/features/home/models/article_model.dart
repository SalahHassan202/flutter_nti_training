class ArticleModel {
  final String title;
  final String description;
  final String image;
  final String author;
  final String authorImage;
  final int likes;
  final int comments;
  final List tags;

  ArticleModel({
    required this.title,
    required this.description,
    required this.image,
    required this.author,
    required this.authorImage,
    required this.likes,
    required this.comments,
    required this.tags,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      image: json["cover_image"] ?? "",
      author: json["user"]["name"] ?? "",
      authorImage: json["user"]["profile_image"] ?? "",
      likes: json["public_reactions_count"] ?? 0,
      comments: json["comments_count"] ?? 0,
      tags: json["tag_list"] ?? [],
    );
  }
}
