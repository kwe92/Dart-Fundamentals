void main() {
  // Record Shape
  //  - Records are structurally typed based on the types of their fields
  //  - A Records shape is the set of fields, field types and field names (if any field names are defined)

  // The Shape of Named Records

  //   - The shape of a Named Record is SCTRICTLY typed
  //       - Named Record shape: property names, types, and values

  // Record Equality (hashCode && == moethods are already defined for Records when they are created)

  //   - Depends on the shape of the record and its values
  //   - The order of named fields does not matter

  ({double x, double y}) point1;
  ({double i, double j}) point2;

  point1 = (x: 3, y: 4);
  point2 = (i: 3, j: 4);

// point1 && point2 have the same shape in regards to type (Duck Type)
// However they lack the same property names
// therefore they are not the same shape

  print("point1 == point2:");
  print(point1 == point2);

// The Shape of Unnamed Records

//  - The shape of an Unnamed Record is similar to Duck Type
//  - Positional field names are arbitrary and are not bound to the Record

  (int x, int y) point3;
  (int i, int j) point4;
  (int i, int j) point5;

  point3 = (42, 56);
  point4 = (42, 56);
  point5 = (42, 6);

  print("point3 == point4:");
  print(point3 == point4);

  print("point4 == point5:");
  print(point4 == point5);
}
