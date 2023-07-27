import '../../utility/spacedPrint.dart';

// Constructing a List using Named Constructors

//   - as stated previously an alternative way to instantiate a List is by way of
//     named "identity" constructors
//   - most named constructors are Factory Constructors allowing for more complex logic when defining their implementation
//     but can be Initalizer Lists for simpler implementations that do not need access to the this keyword

void main() {
  // List Named "Identity" Constructors

  //List.filled | default fixed-length "length can not be changed at compile-time"| modifiable / mutable references "pointers in memory"

  final fixedArr0 = List<dynamic>.filled(5, 0);

  try {
    // attempting to modify the length of a fixed-length List will result in a run-time error
    fixedArr0.add('I can not be added');
  } catch (error, stackTrace) {
    spacedPrint('Error: $error');
  } finally {
    // The references "pointers" can be accessed to modify what object is being help at that point in memory

    spacedPrint(fixedArr0);

    fixedArr0[0] = 'Modified element';

    spacedPrint(fixedArr0);
  }
}
