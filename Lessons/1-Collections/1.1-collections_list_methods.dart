// TODO: Add a lesson on List.generate
// TODO: Look at other list functions

// Generating Lists

//   - Dart provides an easy way to generate both
//     growable lists and fixed length lists
//   - via the static method List.generate

// List.generate

//   - .generate is a factory method that is used to
//      generate N elements of a List
//   - the first argument is the desired length of the List
//     which is 0-base indexed (n - 1) in ascending order
//   - values of the .generate function are
//     handled by the second argument a callback
//     in the shape of:
//       - return_type Function(int index)

// create the shape of our generator callback function

typedef IntGeneratorCallback = int Function(int i);

void main() {
  // declare and initalize our generatorCallback function
  final IntGeneratorCallback generatorCallback = (int index) => index * 2;

  // generate a non-parameterized List (angle brackets with explicit element type information ommited | non-homogeneous)
  final List generatedList = List.generate(
    12,
    generatorCallback,
  );

  // generate a parameterized List (has angle brackets with explicit type information of elements | homogeneous)
  final List<int> fixedGeneratedList = List.generate(
    9,
    generatorCallback,
    growable: false,
  );

  try {
    // will throw an error as the list is not growable
    fixedGeneratedList.add(3);
  } catch (error, stackStrace) {
    print('\nError: $error | error run-time type: ${error.runtimeType}\n');
  } finally {
    print('growable generated List $generatedList\n');
    print('generated list type without specifying parameterized type ${generatedList.runtimeType}\n');
    print('fixed generated List: $fixedGeneratedList\n');
  }
}
