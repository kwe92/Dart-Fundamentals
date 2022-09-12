import 'dart:io';

class Product {
  Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get inital => name.substring(0, 1);
  String get displayName => '($inital)${name.substring(1)}: $price';
}

void main() {
  // Create a list of the entity Product class
  // Display all available products to a user

  List<Product> allProducts = [
    Product(id: 1, name: 'Purple Dream', price: 15.0),
    Product(id: 2, name: 'Orange Paradise', price: 20.0),
    Product(id: 3, name: 'incognito', price: 10.0),
  ];
  stdout.write(allProducts.map((p) => p.displayName).join('\n'));
}
