void main() {
  Product p1 = Product(
    name: "dell precision 3520",
    category: "laptop",
    brand: "dell",
    price: 15.350,
    rating: 4.8,
    quantity: 50,
    discount: 0.5,
    onSale: true,
  );

  p1.printProduct();
}

class Product {
  String name;
  String category;
  String brand;
  double price;
  double rating;
  int quantity;
  double discount;
  bool onSale;

  Product({
    required this.name,
    required this.category,
    required this.brand,
    required this.price,
    required this.rating,
    required this.quantity,
    required this.discount,
    required this.onSale,
  });

  void buy(int amount) {
    if (amount <= quantity) {
      quantity -= amount;
      print('$amount :: $name');
    } else {
      print('$name :: $quantity');
    }
  }

  void restock(int amount) {
    quantity += amount;
  }

  double priceAfterDiscount() {
    if (onSale) {
      return price - (price * discount / 100);
    }
    return price;
  }

  void printProduct() {
    print("name : $name");
    print("catogry : $category");
    print("brand : $brand");
    print("price : $price");
    print("rating : $rating");
    print("quantity : $quantity");
    print("discount : $discount");
    print("onSale : $onSale");
  }
}
