void main() {
// The Shape of named Records

  ({double x, double y}) point1;

  ({double i, double j}) point2;

  point1 = (x: 3, y: 4);

  point2 = (i: 3, j: 4);

// point1 && point2 have the same shape in regards to type (Duck Type)
// however they lack the same property names
// therefore they are not the same shape

  print("point1 == point2:");

  print(point1 == point2);

// The Shape of Unnamed Records

//  - The shape of an Unnamed Record is similar to Duck Types
//  - Positional field names are arbitrary and are not bound to the Records type signature

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

  // Record Shape

  //  - Records are structurally typed based on the types of their fields

  //  - A Records shape (which makes up the records type) is:

  //      -  the set of fields (# of elements)

  //      -  the fields type

  //      -  the named fields (if any named fields are defined within curly brackets {})

  // Record Equality

  //   - (hashCode && == methods are already defined for Records when they are created)

  //   - Depends on the shape of the record and its values

  //   - The order of named fields does not matter