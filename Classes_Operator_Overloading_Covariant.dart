// Operator Overloading with covariant
// Create a Point class and use operator overloading for:
//     - Relational Operator:
//        - ==
//     - Arithmetic Operators:
//        - subtraction, addition, multiplication, and division
// Bonus:
//  - Add Euclidean Distance formula method

class TypeError implements Exception {
  TypeError([this.message = 'Wrong Type']) : super();
  final String message;

  @override
  String toString() => 'TypeError: $message';
}

class Point {
  Point(this.x, this.y);
  final double x;
  final double y;

  bool operator ==(Object other) {
    if (other is Point) {
      return x == other.x && y == other.y;
    } else {
      return false;
    }
  }

  Point operator +(Object other) {
    if (other is Point) {
      return Point(x + other.x, y + other.y);
    } else {
      throw TypeError('${other.runtimeType} is not of type Point.');
    }
  }

  Point operator -(Object other) {
    if (other is Point) {
      return Point(x - other.x, y - other.y);
    } else {
      throw TypeError('${other.runtimeType} is not of type Point.');
    }
  }

  Point operator *(Object other) {
    if (other is Point) {
      return Point(x * other.x, y * other.y);
    } else {
      throw TypeError('${other.runtimeType} is not of type Point.');
    }
  }

  Point operator /(Object other) {
    if (other is Point) {
      return Point(x / other.x, y / other.y);
    } else {
      throw TypeError('${other.runtimeType} is not of type Point.');
    }
  }
}

void main() {}
