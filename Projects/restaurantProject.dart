// Restaurant Project
/*

Write a program that calculates the average rating score
for each restaurant, and adds it as an avgRatting: value
key-value pair for that restaurant.

 */

void main() {
  var restaurants = [
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'rating': [4.0, 3.5, 4.5]
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'rating': [5.0, 4.5, 4.0]
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Indian',
      'rating': [4.0, 4.5, 4.0]
    },
  ];

  for (var restaurant in restaurants) {
    var rating = restaurant['rating'] as List;
    restaurant.addAll({'avgRating': avg(rating)});
  }
  restaurants.forEach((element) {
    element.forEach((key, value) {
      print('Key: $key | Value: $value');
    });
  });

  // var x = 1.324325325432432;

  // print('Test round function: $x rounded: ${round(x)}');
  // print('Test round function: $x rounded: ${round(x, precision: 1)}');
  // print('Test round function: $x rounded: ${round(x, precision: 3)}');
  // print('Test round function: $x rounded: ${round(x, precision: 5)}');
}

num avg(var iter) {
  num iterSum = 0;
  num result = 0;
  for (num element in iter) {
    iterSum += element;
  }
  result = iterSum / iter.length;
  return round(result, precision: 1);
}

double round(var n, {var precision = 0}) {
  var stringN = n.toStringAsFixed(precision);
  var result = double.parse(stringN);
  return result;
}
