class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["thumbnail"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      discountPercentage: (json["discountPercentage"] ?? 0).toDouble(),
      rating: (json["rating"] ?? 0).toDouble(),
      stock: json["stock"] ?? 0,
      tags: List<String>.from(json["tags"] ?? []),
    );
  }
}
