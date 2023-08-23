class Product {
  final int id;
  final String name;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  String get displayName => '($inital)${name.substring(1)}: \$$price\n';
  String get inital => name.substring(0, 1);

  @override
  String toString() => "Product Name: $name\n" "Product Price: $price\n";
}
