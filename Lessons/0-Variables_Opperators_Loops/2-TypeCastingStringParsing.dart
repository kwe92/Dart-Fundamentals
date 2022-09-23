void main() {
  var x = '22';
  // int && double both have a .parse method that parses strings
  int y = int.parse(x);

  String z = y.toString();

  print(x);

  print(y);

  print(z);

  // .runtimeType is a data type property
  print(x.runtimeType);

  print(y.runtimeType);

  print(z.runtimeType);
}
