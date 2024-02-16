// Abstraction representing a natural number
abstract class Nat {
  int value;

  Nat(this.value);
}

// Implementation of the first natural number one
class One implements Nat {
  @override
  int value = 1;

  String toString() => "Nat(value: $value)";
}

// Successor implementation that increments a natural number passed in by one
class Succ extends Nat {
  Nat v;

  Succ(this.v) : super(v.value + 1);

  String toString() => "Succ(value: $value)";
}

// Predecessor implementation that decrements a natural number passed in by one
class Pred extends Nat {
  Nat v;

  Pred(this.v) : super(v.value > 1 ? v.value - 1 : 1);

  String toString() => "Pred(value: $value)";
}

void main() {
  final Nat one = One();

  print(one);

  print(Succ(one));

  print(Succ(Succ(one)));

  print(Succ(Succ(Succ(one))));

  final four = Succ(Succ(Succ(one)));

  print(Pred(four));

  print(Pred(Succ(Succ(one))));

  print(Pred(Succ(one)));

  print(Pred(one));
}
