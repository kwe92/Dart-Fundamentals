import 'dart:io';

class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get displayName => '($inital)${name.substring(1)}: \$$price\n';
  String get inital => name.substring(0, 1);
}

class Items {
  const Items({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;
  double get price => product.price * quantity;
}

class Cart {}

// const global variable
const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushrooms', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.5),
];
void main() {
  while (true) {
    stdout.write(
        'What do you want to do? (v)iew items, (a)dd items, (c)heckout: ');
    final input = stdin.readLineSync();
    if (input == 'a') {
      chooseProduct();
    } else if (input == 'v') {
      final String productListString =
          allProducts.map((p) => p.displayName).join();
      stdout.write('Available Products:' '\n' '$productListString');
    } else if (input == 'c') {
      // TODO Implement
    }
  }
}

// returns a nullable Product? type if we do not have a product the customer is looking for
Product? chooseProduct() {
  final productList = allProducts.map((product) => product.displayName).join();
  // TODO: Implement display list of available products to the user
  stdout.write('Select a product:' '\n' '$productList');
}
