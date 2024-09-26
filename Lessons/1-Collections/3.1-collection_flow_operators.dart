import 'dart:math';

void main() {
  // collection-for List Literals

  // Example: Without collection-for
  const arr = [0, 1, 2, 3];

  var newArr = List<int>.empty(growable: true);

  for (var element in arr) {
    newArr.add(element * 2);
  }

  print(newArr);

  // Example: With collection-for

  // placing a collection-for as the second and fourth elements of an Array
  newArr = [1, for (var element in arr) element + 2, 6, for (var element in arr) (element + 2) * 4];

  print(newArr);

  // Example: With collection-if

  final bool promoActive;

  promoActive = _isPromoActive();

  var navBarTitles = ['Home', 'Furniture', 'Plants', if (promoActive) 'Special Offers'];

  print('nav bar titles: $navBarTitles');
}

bool _isPromoActive() => Random().nextInt(2) == 0 ? false : true;

// Collection Control-flow Operators

//   - collection-if and collection-for are control flow operators for List, Map, and Set literals

//   - they can be used to build the aforementioned collection literals condotionally or with repetition respectively

// collection-for (list comprehension)

//   - a shorter syntax to create a new array based on the elements of an existing array

//   - you can place a collection-for at any element within a new collection literal

// collection-if

//   - conditionally add elements to a collection literal



