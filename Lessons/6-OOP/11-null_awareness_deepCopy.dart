// Custom Deep Copy Method: Maintaining Immutablility

//   - You can implement your own deep copy method to maintain immutability
//   - Allowing you to change some properties while retaining others
//     without the need to reference the same addresses in memory
//     returning a new object of that shape
//     without the need to implement a stateful object

class Credentials {
  const Credentials({this.email = '', this.password = ''});
  final String email;
  final String password;

  Credentials copyWith({String? email, String? password}) => Credentials(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  String toString() => 'Credentials($email,$password)';
}

void main() {
  const credentials = Credentials();
  final update1 = credentials.copyWith(email: 'BakiHanma@anime.org');
  final update2 = update1.copyWith(password: 'Baki');
  print(credentials);
  print(update1);
  print(update2);
}
