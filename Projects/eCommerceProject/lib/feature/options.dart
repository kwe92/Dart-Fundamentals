import 'dart:io';
import '../models/cart.dart';
import '../models/product.dart';
import '../constants/all_products.dart';

class Options {
  const Options();
  // returns a nullable Product? type if we do not have a product the customer is looking for
  // Display list of available products to the user
  static Product? chooseProduct() {
    final productList =
        allProducts.map((product) => product.displayName).join();
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

  static bool checkout(Cart cart) {
    if (cart.isEmpty) {
      stdout.write("Cart is empty.");
      return false;
    }
    final total = cart.total();
    print("Cart Total: \$$total\n");
    stdout.write("Payment in cash: \n");
    final payment = stdin.readLineSync();
    if (payment == null || payment.isEmpty) {
      return false;
    }
    // trys to convert a string into a double else return null, kinda like try_convert in SQL
    final paid = double.tryParse(payment);
    if (paid == null) {
      return false;
    } else if (paid >= total) {
      print("Paid successfully.\n"
          "Change: \$${(paid - total).toStringAsFixed(2)}\n");
      return true;
    } else {
      print("Insufficient funds.\n");
      return false;
    }
  }
}
