import 'product.dart';

class Item {
  final Product product;
  final int quantity;

  const Item({
    required this.product,
    this.quantity = 1,
  });

  double get price => product.price * quantity;

  @override
  String toString() => "$quantity x ${product.name} = $price\n";
}
