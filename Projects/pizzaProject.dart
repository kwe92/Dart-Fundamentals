void main() {
  // Given the following pizza prices bellow
  // Write a program that calculates the total order

  Map pizzaPrices = {'margherita': 5.5, 'pepperoni': 7.5, 'vegetarian': 6.5};

  const order = [
    'margherita',
    'margherita',
    'pepperoni',
    'pepperoni',
    'vegetarian'
  ];

  totalBill(order, pizzaPrices);
}

void totalBill(var order, var pizzaPrices) {
  var result = 0.0;
  for (var item in order) {
    if (pizzaPrices.keys.contains(item) == false) {
      print(
          '$item is not on the menu, please select one of the following margherita, pepperoni, vegetarian');
      break;
    } else {
      result += pizzaPrices[item] as double;
    }
  }
  print('The total bill for your order is: \$${result}.');
  ;
}
