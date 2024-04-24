// Records

//    - similar to a tuple with additional features

//    - heterogeneous statically typed collection of objects

//    - the use of Records requires Dart SDK ^3.0

//    - Characteristics of Records:

//        - anonymous by nature (but can be assigned to variables and type aliases)

//        - Immutable and aggregate type

//        - Fixed size and frozen at compile time

//        - fields in a record can be named or positional

//        - elements of a Record can only be accessed by field name

//        - Records can be deconstructed

//        - allows functions to return multiple values of different types in a type safe manner with brevity and ease

//        - Records are `real values` and can be used:

//                - As variables

//                - As nested values

//                - Passed to and from function

//                - Stored in data structures (lists, maps, and sets)

void divider() => print("---------------------------------------");
void main() {
  // Record expression
  // var record = (type_0, type_1, . . . , type_n)

  var record1 = (
    "string",
    1,
    3.14,
    nestedRecord: (recordId: 99999, "records number 2"),
    nestedList: [1, 2, 3, 4, 5],
  );

  divider();
  print("record1: $record1");
  divider();
  print("nestedList: ${record1.nestedList}");
  divider();
  print("nestedRecord: ${record1.nestedRecord}");
  divider();
  print("record1 second element: ${record1.$2}");
}
