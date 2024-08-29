// TODO: refactor comments and code

void main() {
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

void divider() => print("---------------------------------------");


// Records (Product Type - Type Theory)

//    - also known as: Struct, Structure, or compound data type

//    - heterogeneous (of different kind) statically typed collection of fields / objects

//    - can be viewed as an object that is a collection of named or unnamed fields, without any methods or operations to manipulate those fields

//    - the use of Records requires Dart SDK ^3.0

//    - Characteristics of Records:

//        - anonymous by nature (but can be assigned to variables and type aliases)

//        - Immutable and aggregate type

//        - Fixed size and frozen at compile time

//        - fields in a record can be named or unnamed (accessed by position)

//        - elements of a Record can be accessed by field name or position name if the field name is omitted

//        - Records can be deconstructed using destructuring assignment (most mmodern languages offer some form of pattern matching to destructure structs)

//        - allows functions to return multiple values of different types in a type safe manner with brevity and ease

//        - Records are `real values` and can be used:

//                - As variables

//                - As nested values

//                - Passed to and from function

//                - Stored in data structures (lists, maps, and sets)

// Record expression

//   - var record = (type_0, type_1, . . . , type_n)

// When to Use Records

//   - when you want to bundle togther related data without the need to perform operations on that data

//   - when you want to return multiple values from a function

//   - when you are interacting with a database and don't need to perform operations on that data

