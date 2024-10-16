class Origin extends Point {
  // redirecting to super constructor
  Origin() : super(0, 0);
}

class Point {
  final double x;

  final double y;

  const Point(this.x, this.y);

// Redirecting Constructor (Initalizer List)
  Point.alongXaxis(double x) : this(x, 0);

  Point.alongYaxis(double y) : this(0, y);

  Point.origin() : this(0, 0);

  // Redirecting Factory Constructor
  factory Point.origin2() = Origin;

// different ways to achieve the same thing
  Point.origin3()
      : x = 0,
        y = 0;

  @override
  String toString() => 'Point(x: $x, y: $y)';
}

void main() {
  final p1 = Point.alongXaxis(42);

  final p2 = Point.alongYaxis(42.314159);

  final p3 = Point(42, 34);

  final origin1 = Point.origin();

  final origin2 = Point.origin2();

  final origin3 = Point.origin3();

  final points = [p1, p2, p3];

  final origins = [origin1, origin2, origin3];

  print('\n');

  enumerate(points);

  enumerate(origins);
}

void enumerate(Iterable iter) => iter.toList().asMap().forEach(
      (index, element) => print('$index: $element\n'),
    );


// Redirecting Constructor (Named Constructor)

//   - delegates the initialization of an objects fields to another constructor within the same class
//     or to a parent super class

//   - redirecting constructors can not have a constructor body

//   - redirecting constructors require a class or its parrent class to have a Generative Constructor

//   - redirecting constructors of a sub class to a super class can be unnamed

//   - redirecting constructors within the same class have to be named as a generative constructor is required

//   - uses an Initalizer List followed by the this keyword for internal redirecting constructors
//     and uses an Initalizer List followed by the super keyword for sub class redirection

// Why Use Redirection

//   - useful to have some of a classes fields initalized with default values
//     and others initialized with values passed in as arguments to the reedirecting constructor
//     without the need to modify the generative constructor to have default values
//     as all instances may not need default values but will need some default values in special cases

//   - to initalize the parameters of a super class and write less boiler plate code

// Redirecting Factory Constructor

//   - can create instances of a sub class without the need to repeat the formal parameters and their default values

//   - the syntax is a bit strange:

//       - factory Point.origin2() = Origin;

//       - uses the assignment operator instead of an arrow function but still has parenthesis
//         the sub class is also not invoked
