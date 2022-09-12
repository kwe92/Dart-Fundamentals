import 'dart:io';

class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get displayName => '($inital)${name.substring(1)}: \$$price\n';
  String get inital => name.substring(0, 1);

  @override
  String toString() => "Product Name: $name\n" "Product Price: $price\n";
}

class Item {
  const Item({required this.product, this.quantity = 1});
  final Product product;
  final int quantity;
  double get price => product.price * quantity;

  @override
  String toString() => "$quantity x ${product.name} = $price\n";
}

class Cart {
  final Map<int, Item> _items = {};

  void addProduct(Product product) {
    final item = _items[product.id];
    if (item == null) {
      _items[product.id] = Item(product: product, quantity: 1);
    } else {
      _items[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  double total() {
    final num result = _items.values
        .map((item) => item.quantity * item.price)
        .reduce((value, element) => value + element);
    return double.parse(result.toStringAsFixed(2));
  }

  @override
  String toString() {
    // Defensive check
    if (_items.isEmpty) {
      return "Cart is empty";
    } else {
      final itemizedList = _items.values.map((item) => item.toString()).join();
      return "\n------\n$itemizedList" + "Total: \$${total()}\n------\n";
    }
  }
}

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
  var cart = Cart();
  while (true) {
    stdout.write(
        'What do you want to do? (v)iew items, (a)dd items, (c)heckout: \n');
    final String? input = stdin.readLineSync();
    if (input?.toLowerCase() == 'a') {
      final chosenPrduct = chooseProduct();
      if (chosenPrduct != null) {
        stdout.write("$chosenPrduct added to the cart.\n");
        cart.addProduct(chosenPrduct);
      }
    } else if (input == 'v') {
      stdout.write("$cart\n");
    } else if (input == 'c') {
      // TODO Implement
    } else if (input == 'q') {
      break;
    }
  }
}

// returns a nullable Product? type if we do not have a product the customer is looking for
// Display list of available products to the user
Product? chooseProduct() {
  final productList = allProducts.map((product) => product.displayName).join();
  final String? userInput;
  stdout.write('Select a product:' '\n' '$productList');
  userInput = stdin.readLineSync();
  for (var product in allProducts) {
    if (product.inital == userInput?.toLowerCase()) {
      return product;
    }
  }
  stdout.write("Product not found!\n");
  return null;
}
