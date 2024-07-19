extension Capitalize on String {
  String capitalize() {
    var letter = this.substring(0, 1);

    var rest = this.substring(1, this.length);

    var capitalLetter = letter.toUpperCase();

    return capitalLetter + rest;
  }

  String capitalizeAll() {
    var arr = this.split(" ");

    var arr2 = arr.map((word) => word.capitalize()).toList();

    final result = arr2.reduce(
      (value, element) => value + " " + element,
    );

    return result;
  }
}

void main() {
  var quote =
      "Books are the training weights of the mind. They are very helpful, but it would be a bad mistake to suppose that one has made progress simply by having internalized their contents.”";

  print(quote.capitalizeAll());
}
