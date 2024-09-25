void main() {
  for (final _Candidate(:name, :yearsExperience) in _candidates) {
//           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ destructuring a subset of an objects fields, omitting the email field
    print('$name has $yearsExperience years of experience.');
  }
}

// for-in With Pattern

//   - you can pattern match elements within an iterable

//   - if the elements are objects with fields you can destructure
//     the entire object of a subset of the fields on the object

final _candidates = [
  _Candidate(
    name: 'Baki',
    email: 'hanma@grappler.io',
    yearsExperience: 2,
  ),
  _Candidate(
    name: 'Shoto',
    email: 'icyhot@myhero.io',
    yearsExperience: 3,
  ),
  _Candidate(
    name: 'Neji',
    email: 'plam@leafs.io',
    yearsExperience: 6,
  ),
  _Candidate(
    name: 'Renji',
    email: 'swordofthedragon@bleach.io',
    yearsExperience: 8,
  ),
];

class _Candidate {
  final String name;
  final String email;
  final int yearsExperience;
  const _Candidate({
    required this.name,
    required this.email,
    required this.yearsExperience,
  });

  void interview() => print('Interview request sent to $name at $email.');
}
