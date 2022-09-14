/*

The Dart language supports the following types−

Numbers
Strings
Booleans
Lists
Maps
Numbers

Numbers in Dart are used to represent numeric literals. The Number Dart come in two flavours:

Integer − Integer values represent non-fractional values, i.e., numeric values without a decimal point.
          For example, the value "10" is an integer. Integer literals are represented using the int keyword.

Double − Dart also supports fractional numeric values i.e. values with decimal points.
         The Double data type in Dart represents a 64-bit (double-precision) floating-point number.
         For example, the value "10.10".
         The keyword double is used to represent floating point literals.

Strings

Strings represent a sequence of characters. For instance, if you were to store some data like name
, address etc. the string data type should be used. A Dart string is a sequence of UTF-16 code units. 
Runes are used to represent a sequence of UTF-32 code units.

The keyword String is used to represent string literals.
String values are embedded in either single or double quotes.

Boolean

The Boolean data type represents Boolean values true and false.
Dart uses the bool keyword to represent a Boolean value.


*/

void main() {
  String fairy = "Kira";

  int num_cat = 1;

  double pie = 3.14;

  bool goddess = true;

  // the keyword var can be used instead of explicitly assigning a data type

  var spiritAnimal = 'Stich';

  // the keywords final and const make your variables immutable
  // const is a runtime constant

  final int x = 2;

  const int y = 3;

  // $ is a single variable format literal.
  // Use ${} when more than one variable is being specified.
  // print seems to add a new line to the console
  print(
      "$fairy is a fairy goddess: $goddess with $num_cat cat who wants to know what is special about pie: $pie");

  print(spiritAnimal);

  spiritAnimal = "Ifrit";

  print(spiritAnimal);
}
