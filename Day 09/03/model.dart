class Model {
  final String? name;
  final String? description;
  final double? price;
  final String? image;

  Model({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    name: json["title"],
    description: json["description"],
    price: json["price"],
    image: json["thumbnail"],
  );
}

