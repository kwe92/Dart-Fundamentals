// Cascade notation

//   - (.., ?..)
//   - sequence of operations on the same object
//   - allowing access to member variables and methods

// why is Cascading useful?

//   - create less temporary variables

// Stateful objects

//   - only seems useful on mutable objects

class Paint {
  double StrokeWidth;
  double StrokeCape;
  String color;

  Paint({
    required this.StrokeWidth,
    required this.StrokeCape,
    required this.color,
  });
}

void main() {
  // instantiate mutable instance

  Paint paint = Paint(
    StrokeWidth: 10.0,
    StrokeCape: 16.0,
    color: 'purple',
  );

  print(paint);

  // use casecading to reassign
  paint
    ..color = 'green'
    ..StrokeCape = 12.0
    ..StrokeWidth = 16.0;
}
