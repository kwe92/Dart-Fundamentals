// Abstraction representing a whole number
abstract class Whole {
  int value;

  Whole(this.value);
}

// Implementation of the first whole number zero
class Zero implements Whole {
  @override
  int value = 0;

  String toString() => "Whole(value: $value)";
}

// Successor implementation that increments a whole number passed in by one
class Succ extends Whole {
  Whole v;

  Succ(this.v) : super(v.value + 1);

  String toString() => "Succ(value: $value)";
}

// Predecessor implementation that decrements a whole number passed in by one
class Pred extends Whole {
  Whole v;

  Pred(this.v) : super(v.value > 0 ? v.value - 1 : 0);

  String toString() => "Pred(value: $value)";
}

void main() {
  // TODO: we could write this operation out in lambda calculus

  final Whole one = Succ(Zero());

  print(one);

  print(Succ(one));

  print(Succ(Succ(one)));

  print(Succ(Succ(Succ(one))));

  final four = Succ(Succ(Succ(one)));

  print(Pred(four));

  print(Pred(Succ(Succ(one))));

  print(Pred(Succ(one)));

  print(Pred(one));

  final num = add(one, one);

  print("add function result: $num");

  // TODO: we could write this operation out in lambda calculus

  print("1 + 2 = ${add(
    Succ(Zero()),
    Succ(Succ(Zero())),
  )}");

  print("4 + 6 = ${add(
    Succ(Succ(Succ(Succ(Zero())))),
    Succ(Succ(Succ(Succ(Succ(Succ(Zero())))))),
  )}");
}

// recursively add two numbers
Whole add(Whole n1, Whole n2) => n1.value == 0 ? n2 : add(Pred(n1), Succ(n2));
