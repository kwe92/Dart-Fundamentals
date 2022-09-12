import 'dart:io';

class Product {
  Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get inital => name.substring(0, 1);
  String get displayName => '($inital)${name.substring(1)}: $price\n';

  @override
  String toString() => "Product Name: $name\n" "Product Price: $price\n";
}

List<Product> allProducts = [
  Product(id: 1, name: 'Purple Dream', price: 15.0),
  Product(id: 2, name: 'Orange Paradise', price: 20.0),
  Product(id: 3, name: 'incognito', price: 10.0),
];

void main() {
  final String productListString =
      allProducts.map((product) => product.displayName).join();
  final String? productChoice;
  stdout.write("Please select an available product:\n" "$productListString");
  productChoice = stdin.readLineSync();
  for (var product in allProducts) {
    if (product.inital.toLowerCase() == productChoice?.toLowerCase()) {
      stdout.write("You have chosen:\n" "$product");
    } else {
      stdout.write("Product not found!");
    }
  }
  // print(productListString);
}
