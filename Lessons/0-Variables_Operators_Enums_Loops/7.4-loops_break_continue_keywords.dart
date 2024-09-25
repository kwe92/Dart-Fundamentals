void main() async {
  // break example
  bool isShutDownRequested = false;

  final shutDownRequest = Future.delayed(const Duration(seconds: 1));

  shutDownRequest.then((_) {
    isShutDownRequested = true;
  });

  print('starting to process incoming data.');

  while (true) {
    if (isShutDownRequested) {
      print('shutdown requested, done processing incoming data.');
      break;
    }
    await _processIncomingRequestData();
  }

  // continue example
  for (var candidate in _candidates) {
    if (candidate.yearsExperience < 5) {
      continue;
    }
    candidate.interview();
  }

  // the above for loop code also be written imperitively
  _candidates.where((candidate) => candidate.yearsExperience > 5).forEach((candidate) => candidate.interview());
}

Future<void> _processIncomingRequestData() async {
  await Future.delayed(const Duration(milliseconds: 200));
  print('processing incoming data...');
}

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

// break keyword

//   - used to stop a loop based on some condition

// continue keyword

//   - skip to the next loop iteration (block of code)
//     if the condition is met
