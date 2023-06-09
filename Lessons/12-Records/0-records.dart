// Records
//    - Must use Dart SDK ^3.0 (Require language version at least 3.0.)
//    - Records are:
//        - An anonymous, immutable and aggregate type
//        - Fixed size
//        - FROZEN at compile time
//        - heterogeneous (elements can be of multiple types)
//        - typed
//        - Bundle multiple objects into a single object
//        - Record fields are:
//                - named || unnamed($i) wrapped in parentheses
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
