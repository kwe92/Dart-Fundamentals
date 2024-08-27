void main() {
  print(computeHailstoneSequence2(5));
}

// TODO: review the difference between the two implemenations | why do they work?
// TODO: Explain what the hailstone sequence is and its meanings | https://web.mit.edu/6.031/www/sp22/classes/01-static-checking/

/// Computes the hailstone sequence recursively.
/// Assumes that the value of n > 0.
List<int> computeHailstoneSequence(int n) {
  List<int> seq = [];

  seq.add(n);

  _innerRecursiveClosure(int n, List<int> seq) {
    if (n == 1) {
      return seq;
    } else if (n % 2 == 0) {
      n = n ~/ 2;
      seq.add(n);
      _innerRecursiveClosure(n, seq);
    } else {
      n = 3 * n + 1;
      seq.add(n);
      _innerRecursiveClosure(n, seq);
    }
    return seq;
  }

  return _innerRecursiveClosure(n, seq);
}

/// Computes the hailstone sequence.
/// Assumes that the value of n > 0.
List<int> computeHailstoneSequence2(int n) {
  List<int> seq = [];
  seq.add(n);

  while (n != 1) {
    if (n % 2 == 0) {
      n = n ~/ 2;
    } else {
      n = 3 * n + 1;
    }
    seq.add(n);
  }
  return seq;
}

// List<int> computeHailstoneSequence(int n, List<int> seq) {
//   if (n == 1) {
//     return seq;
//   } else if (n % 2 == 0) {
//     n = n ~/ 2;
//     seq.add(n);
//     computeHailstoneSequence(n, seq);
//   } else {
//     n = 3 * n + 1;
//     seq.add(n);
//     computeHailstoneSequence(n, seq);
//   }
//   return seq;
// }
