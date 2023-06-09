void main() {
  // The Shape of Named Records
  //     - The shape of a Named Record is SCTRICTLY typed
  //          - The property name is included in the shape of the Record

  ({double x, double y}) point1;
  ({double i, double j}) point2;

  point1 = (x: 3, y: 4);
  point2 = (i: 3, j: 4);

// point1 && point2 have the same shape in regards to type (Duck Type)
// However they lack the same property names
// therefore they are not the same shape
  print("point1 == point2: false");
  print(point1 == point2);

// The Shape of Unnamed Records
//  - The shape of Unnamed Records is Duck Typed (only type and value are considered on the equality)
  (int x, int y) point3;
  (int i, int j) point4;
  (int i, int j) point5;

  point3 = (42, 56);
  point4 = (42, 56);
  point5 = (42, 6);

  print("point3 == point4");
  print(point3 == point4);

  print("point4 == point5");
  print(point4 == point5);
}
