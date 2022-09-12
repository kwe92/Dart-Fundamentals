import 'item.dart';
import 'product.dart';

class Cart {
  final Map<int, Item> _items = {};

  bool get isEmpty => _items.isEmpty;

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
