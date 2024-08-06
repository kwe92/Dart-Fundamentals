void main() {
  // must return an element of the type specified by the collection
  final _Item reducedItem = _items.reduce((prevItem, nextItem) => _Item("All Items", prevItem.price + nextItem.price));

  // can return any initial value
  final double totalGroceryPrice = _items.fold<double>(0, (initialValue, nextItem) => initialValue + nextItem.price);

  String gorceryItemNames = _items.fold<String>("", (initialValue, nextItem) => initialValue + nextItem.name + ", ");

  gorceryItemNames = gorceryItemNames.substring(0, gorceryItemNames.length - 2);

  print(reducedItem);

  print(totalGroceryPrice);

  print(gorceryItemNames);
}

final List<_Item> _items = [
  _Item("Salmon", 10.99),
  _Item("Brussel Sprouts", 3.99),
  _Item("Potatos", 4.99),
  _Item("Jasmine Rice", 3.99),
];

class _Item {
  final String name;
  final double price;

  _Item(this.name, this.price);

  @override
  String toString() => '_Item(name: $name, price: $price)';
}




// Reduce vs Fold

//   - both reduce a collection down to a single value

//   - fold allows the user to specify an initial value and the return type of the reduction