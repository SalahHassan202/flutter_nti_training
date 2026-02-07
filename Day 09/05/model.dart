class Model {
  final String title;
  final String description;
  final String image;

  Model({
    required this.title,
    required this.description,
    required this.image,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    final data = json['data'][0];

    final links = json['links'] as List? ?? [];

    String imageUrl = '';
    for (var link in links) {
      if (link['render'] == 'image') {
        imageUrl = link['href'];
        break;
      }
    }

    return Model(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      image: imageUrl,
    );
  }
}

