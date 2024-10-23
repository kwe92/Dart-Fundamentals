class Bool {
  int truthValue;

  Bool(this.truthValue);

  int operator *(covariant int other) =>
      isBetween0and1(other) ? truthValue * other : throw Exception("integer representation of truth values must be 0 false or 1 true.");

  int operator +(covariant int other) =>
      isBetween0and1(other) ? truthValue + other : throw Exception("integer representation of truth values must be 0 false or 1 true.");

  int operator -(covariant int other) =>
      isBetween0and1(other) ? truthValue - other : throw Exception("integer representation of truth values must be 0 false or 1 true.");
}

class False extends Bool {
  False(super.truthValue) {
    if (truthValue != 0) {
      throw Exception("the integer representation of false is 0");
    }
  }
}

class True extends Bool {
  True(super.truthValue) {
    if (truthValue != 1) throw Exception("the integer representation of true is 1");
  }
}

bool isBetween0and1(int x) {
  return !(x < 0 || x > 1);
}

void main() {
  Bool _false = False(0);

  Bool _true = True(1);

  print("and operation on T F: ${and(_true, _false).truthValue}");

  print("or operation on T T: ${or(_true, _true).truthValue}");

  print("or operation on F T: ${or(_false, _true).truthValue}");

  print("not operation on T: ${not(_true).truthValue}");

  print("not operation on F: ${not(_false).truthValue}");
}

Bool and(Bool a, Bool b) => Bool(a.truthValue * b.truthValue);
Bool or(Bool a, Bool b) => Bool(a.truthValue + b.truthValue - a.truthValue * b.truthValue);

Bool not(Bool a) => Bool(1 - a.truthValue);
