class LaptopModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final num price;

  LaptopModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  factory LaptopModel.fromJson(Map<String, dynamic> json) {
    return LaptopModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      description: json["description"] ?? "",
      price: json["price"] ?? 0,
    );
  }
}
