void main() {
  print(computeHailstoneSequenceRecursive(-1));
}

/// Computes the hailstone sequence recursively.
/// Assumes that the value of n > 0 (Possitive Integer / Natural Number).
/// Returns hailstone sequence starting with n and ending with 1.
List<int> computeHailstoneSequenceRecursive(int n) {
  if (n <= 0) {
    throw Exception(' The value of n must be a positive integer, value passed in was $n');
  }
  // initial empty sequence / reassignable reference and mutable object you wish the closure to keep track of
  List<int> seq = [];

  // add initial element to the List
  seq.add(n);

  // a recursive closure that computes the hailstone sequence until n == 1 and then returns the recurrence relation solution
  List<int> _innerRecursiveClosure(int n, List<int> seq) {
    // terminating condition, if n == 1 stop the computation and return the sequence
    if (n == 1) {
      return seq;
    }

    // n is even
    if (n % 2 == 0) {
      n = n ~/ 2;
      seq.add(n);
      return _innerRecursiveClosure(n, seq);
    }

    // n is odd
    else {
      n = 3 * n + 1;
      seq.add(n);
      return _innerRecursiveClosure(n, seq);
    }
  }

  return _innerRecursiveClosure(n, seq);
}

/// Computes the hailstone sequence.
/// Assumes that the value of n > 0 (Possitive Integer / Natural Number).
/// Returns hailstone sequence starting with n and ending with 1.
List<int> computeHailstoneSequence(int n) {
  if (n <= 0) {
    throw Exception(' The value of n must be a positive integer, value passed in was $n');
  }

  List<int> seq = [];

  // while n not equal to 1 mutate (reassign) n depending on if n is evenly divisible by 2 | //?? NOTE: if you added the final keyword prefixing a parameter type that parameter can only be set once (immutable / unreassignable) within a function e.g. (final int n), otherwise it is a reassignable local variable.
  while (n != 1) {
    print('mutable parameter value n: $n');

    // add element to List
    seq.add(n);

    // mutate (reassign) n
    if (n % 2 == 0) {
      n = n ~/ 2;
    } else {
      n = 3 * n + 1;
    }
  }
  // once n == 1 then add 1 to the end of the List
  seq.add(n);

  return seq;
}

// Truncating Division / Floor Operator ~/

//   - divided and floor returning an integer result


// Hailstone Sequence

//   - Sequences of integers generated in the Collatz problem.

//   - a recurrence relation over the positive integers were the sequence elements may bounce up and down
//     before eventually ending in 1 and falling into the small loop of [4, 2, 1]

//   - Sequence {a_n}

//   - Recurrence Relation:

//       - a_n = 1 / 2 * a_(n-1) for a_(n-1) even || a_(n-1) / 2 for a_(n-1) even

//       - a_n = 3 *  a_(n-1) + 1 for a_(n-1) odd


// Example Table:

// inital condition / term: a_0	sequence terms: [a_0, a_1, a_2, ... a_n]
// n = 1	recurrence relation solution: [1]
// n = 2	recurrence relation solution: [2, 1]
// n = 3	recurrence relation solution: [3, 10, 5, 16, 8, 4, 2, 1]
// n = 4	recurrence relation solution: [4, 2, 1]
// n = 5	recurrence relation solution: [5, 16, 8, 4, 2, 1]
// n = 6	recurrence relation solution: [6, 3, 10, 5, 16, 8, 4, 2, 1]

// How The Hailstone Sequence Got Its Name

//   - the hailstone sequence got its name from the bouncing up and down of the integer elements before
//     finally ending in 1 and falling into the loop of [4, 2, 1], similar to how hailstones form in clouds
//     bouncing up and down until they eventually fall to the earth after building enough weight
