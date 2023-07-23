import '../../utility/spacedPrint.dart';

// Iterable.generate | Parameterized Named Constructor

//   - a parameterized named constructor of Iterable class
//   - as the identity (name) implies it is a genterator of an Iterable
//   - Iterable.generate two parameters, the first is the desired lenth of the Iterable
//     the second is a parameterized generator callback that requires a positional integer parameter
//   - the calback can be a pointer it a callback or a lambda function

// define shape of the parameterized generator callback function
typedef generatorCallback<E> = E Function(int index);

// declare variable as a generatorCallback then initalize it with a lambda function
final generatorCallback<int> intGeneratorCallback = (int index) => index * 2;
void main() {
  // Generate a Iterable of length 6
  final Iterable<int> generatedIterable = Iterable.generate(
    6,
    intGeneratorCallback,
  );

  spacedPrint(generatedIterable, prefix_space: true);
}
