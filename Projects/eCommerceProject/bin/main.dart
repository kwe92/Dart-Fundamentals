import 'dart:io';
import '../lib/models/cart.dart';
import '../lib/feature/options.dart';

void main() {
  var cart = Cart();
  while (true) {
    stdout.write(
        'What do you want to do? (v)iew items, (a)dd items, (c)heckout: \n');
    final String? input = stdin.readLineSync();
    if (input?.toLowerCase() == 'a') {
      final chosenPrduct = Options.chooseProduct();
      if (chosenPrduct != null) {
        stdout.write("$chosenPrduct added to the cart.\n");
        cart.addProduct(chosenPrduct);
      }
    } else if (input == 'v') {
      stdout.write("$cart\n");
    } else if (input == 'c') {
      final paidSuccessfully = Options.checkout(cart);
      if (paidSuccessfully) {
        print("Thank you for supporting our local business!\n");
        break;
      }
    } else if (input == 'q') {
      break;
    }
  }
}
