void main() {
  final List<_Item> _items = [
    _Item(name: "Salmon", price: 10.99),
    _Item(name: "Brussel Sprouts", price: 3.99),
    _Item(name: "Potatos", price: 4.99),
    _Item(name: "Jasmine Rice", price: 3.99),
  ];
  // must return an element of the type specified by the collection
  final reducedItem = _items.reduce((prevItem, nextItem) => _Item(name: "Total item price", price: prevItem.price + nextItem.price));

  print('\nreduced item: $reducedItem\n');

  // can return any initial value
  final totalItemPrice = _items.fold<double>(0, (initialValue, nextItem) => initialValue + nextItem.price);

  print('total item price: $totalItemPrice\n');

  var gorceryItemNames = _items.fold<String>("", (initialValue, nextItem) => initialValue + nextItem.name + ", ");

  print('gorcery item names: $gorceryItemNames\n');

  gorceryItemNames = gorceryItemNames.substring(0, gorceryItemNames.length - 2);

  print('$gorceryItemNames\n');
}

class _Item {
  final String name;
  final double price;

  _Item({required this.name, required this.price});

  @override
  String toString() => 'Item(name: $name, price: $price)';
}




// Reduce vs Fold

//   - both reduce a collection down to a single value

//   - fold allows the user to specify an initial value and the return type of the reduction