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

  final total_bill = totalBill(order, pizzaPrices);

  print('The total bill for your order is: \$${total_bill}.');
}

double totalBill(var order, var pizzaPrices) {
  var result = 0.0;
  for (var item in order) {
    result += pizzaPrices[item] as double;
  }
  return result;
}
