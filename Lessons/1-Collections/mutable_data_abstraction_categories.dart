// CS 312 Lecture 16
// Mutable data abstractions

// Observers

//   - return information about an abstract data type without mutation

// Creators

//   - creates an instance an abstract data type without mutating the original abstraction

// Mutators | methods or functions with side-effects

//   - mutates an abstract data type in some way
//   - produces some side effect that the user should be informed about

void main() {
  List<int> arr0 = [1, 2, 3, 4];

  print("Observer method List.length on List arr0: ${arr0.length}");

  var arr1 = List.from({5, 6, 7, 8});

  print("Creator method List.from, this example creates a List from a Set but the elements themselves remain the same: ${arr1}");

  arr1.add(42);

  print("Mutator method List.add, which has the side effect of mutating the List arr1: $arr1");
}
