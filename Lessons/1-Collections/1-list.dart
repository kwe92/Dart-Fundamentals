// TODO: read docs on lists in dart and make a lesson

// List

//   - An indexable collection of objects witha length
//   - 0-based indexed array
//   - index has a one-to-one correspondence with Whole numbers {0, 1, 2, 3,...}
//   - if type is omitted non-homogeneous by default i.e. <dynamic>[]
//   - List literals <E>[] can be declared as Iterable

// Most Common List Implementations (sub-classes)

//   Fixed-length List

//     - The length is determined at compile-time and can not be changed
//     - operations attempting to change the length by adding or removing elements will throw an error

//   Growable List

//     - the default implementation of a List literal <E>[]
//     - an internal buffer is kept and grows as the list grows
//     - allowing for amortized constant time operations
void main() {
  var arr = List.empty();

  // arr[0] = 42;

  print(arr);
}
