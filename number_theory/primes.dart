import 'dart:math';

int ayonPrime0(int n) => (pow(n, 2) + n + pow(2, n) - 1).toInt();

// New Prime Algo
int ayonPrime1(int n) => (pow(3, n) - 2).toInt();

int mersennePrime(int n) => ((pow(2, n) - 1)).toInt();

// Generate array of whole numbers in a given range exclusive
List range({int start = 0, required int range}) => (Iterable.generate(range).map((ele) => ele + start)).toList();

// Function to check whether a number is prime
bool isPrime(int n) {
  // Corner case
  if (n <= 1) {
    return false;
  }

  // Check from 2 to sqrt(n)
  for (int i = 2; i < n; i++) {
    if (n % i == 0) {
      print('$n is divisible by $i');
      return false;
    }
  }
  return true;
}

int main() {
  int x = 22;

  // print('Proof of Ayon Algorithm: ${ayonPrime(x)} ${isPrime(ayonPrime(x))}');

  print('Proof of Mersenne Algorithm: ${mersennePrime(x)} ${isPrime(mersennePrime(x))}');

  print('Algo 1: ${ayonPrime1(x)} ${isPrime(ayonPrime1(x))}');

  return 0;
}

// Largest Prime Found 31_381_059_607
// x = 22
// Maybe 71 takes sa really long time to compute

// Ayon Prim
// - Largest 34

List<int> primes = [
  2,
  3,
  5,
  7,
  11,
  13,
  17,
  19,
  23,
  29,
  31,
  37,
  41,
  43,
  47,
  53,
  59,
  61,
  67,
  71,
  73,
  79,
  83,
  89,
  97,
  101,
  103,
  107,
  109,
  113,
  127,
  131,
  137,
  139,
  149,
  151,
  157,
  163,
  167,
  173,
  179,
  181,
  191,
  193,
  197,
  199,
  211,
  223,
  227,
  229,
  233,
  239,
  241,
  251,
  257,
  263,
  269,
  271,
  277,
  281,
  283,
  293,
  307,
  311,
  313,
  317,
  331,
  337,
  347,
  349,
  353,
  359,
  367,
  373,
  379,
  383,
  389,
  397,
  401,
  409,
  419,
  421,
  431,
  433,
  439,
  443,
  449,
  457,
  461,
  463,
  467,
  479,
  487,
  491,
  499,
  503,
  509,
  521,
  523,
  541,
  547,
];
