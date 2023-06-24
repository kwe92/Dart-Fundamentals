// ignore_for_file: unused_catch_stack

// Iterable: Lists

//   - 0-based indexed array
//   - one-to-one correspondence to Whole numbers {0, 1, 2, 3,...}
//   - non-homogeneous by default
//   - List literals [] can be declared as Interable

void main() {
  // const arrays are frozen at compile-time
  const Iterable<String> heroNamesTest = ['Goku', 'Naruto', 'Gon', 'Deku'];

  try {
    // a run-time error is thrown
    // heroNamesTest[3] = 'Almight';
  } catch (errorMessage, stackTrace) {
    print('\nError Message: $errorMessage\n');
  } finally {
    print('\nSome anime charaters $heroNamesTest\n');
  }
}
