// Exercise: Restaurant rating with classes

// Create a Class Restaurant:
//    - 3 required kwargs name, cuisine, ratings as String, String, List<double>

// Add some functionality to this class so that it can be used to:
// Get the total number of ratings
// Get the average rating
void main() {
  final Restaurant r1 = Restaurant(
      name: 'Titos', cuisine: 'Tex Mex', ratings: [4.6, 4.5, 4.9, 4.1]);

  print('Number of ratings: ${r1.numRatings}');

  print('Average ratings: ${r1.avgRatings()}');
}

class Restaurant {
  Restaurant(
      {required this.name, required this.cuisine, required this.ratings});
  final String name;
  final String cuisine;
  final List<double> ratings;
  int get numRatings => this.ratings.length;
  // Using reduce method
  double? avgRatings() {
    if (this.ratings.isEmpty) return null;
    return round(
        this.ratings.reduce((value, element) => value + element) /
            this.ratings.length,
        2);
  }
}

double round(num x, [var p = 0]) => double.parse(x.toStringAsFixed(p));
