// Patterns
//  - What patterns do
//      - Matching
//      - Destructuring

//  What Patterns are
//  - syntactic category
//  - Represents a the shape of a set of values that may match against actual values

// Switch pattern

typedef ABRecord = ({
  int a,
  int b,
});
void main() {
  final a = 4;
  final b = 2;

  final ABRecord record1 = (a: a, b: b);

  switch (record1) {
    case (a: 4, b: 2):
      print(
        '$a' + '$b',
      );
    default:
      print("default called");
  }
}
