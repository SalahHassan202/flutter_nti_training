List<Model> products = [];

void main() {
  addProduct(120, 120, "فراولة", 120, "فراولة.png");
  addProduct(120, 120, "بطيخ", 200, "بطيخ.png");
  addProduct(120, 120, "افوكادو", 170, "افوكادو.png");
  addProduct(120, 120, "اناناس", 100, "اناناس.png");
  addProduct(120, 120, "موز", 70, "موز.png");
  addProduct(120, 120, "مانجا", 310, "مانجا.png");

  for (var p in products) {
    p.printData();
  }
}

class Model {
  double width;
  double height;
  String name;
  double price;
  String image;

  Model(this.width, this.height, this.name, this.price, this.image);

  void printData() {
    print(name);
    print(price);
    print(width);
    print(height);
    print(image);
    print("====================");
  }
}

void addProduct(
  double width,
  double height,
  String name,
  double price,
  String image,
) {
  products.add(Model(width, height, name, price, image));
}
