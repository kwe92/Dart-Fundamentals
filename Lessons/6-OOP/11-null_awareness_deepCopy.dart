class UserCredentials {
  final String name;
  final String email;
  final String password;
  final bool isAdmin;

  const UserCredentials({
    required this.name,
    required this.email,
    required this.password,
    required this.isAdmin,
  });

  UserCredentials copyWith({
    String? name,
    String? password,
    String? email,
    bool? isAdmin,
  }) =>
      UserCredentials(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        isAdmin: isAdmin ?? this.isAdmin,
      );

  @override
  String toString() => 'UserCredentials(name: $name, email: $email, password: $password, isAdmin: $isAdmin)';
}

void main() {
  final user = UserCredentials(
    name: 'Gaara',
    email: 'kingofsand@naruto.anime',
    password: 'SandKing',
    isAdmin: true,
  );

  final UserCredentials updatedUser = user.copyWith(
    password: '1TailedSandDemonKing',
  );

  final UserCredentials anotherUpdate = updatedUser.copyWith(email: 'HiddenInTheSand@naruto.anime');

  print('\nCurrent user credentials:\n\n$user\n');

  print('\nFirst update user credentials:\n\n$updatedUser\n');

  print('\nSecond update user credentials:\n\n$anotherUpdate\n');
}
// Custom Deep Copy Method: Maintaining Immutablility

//   - Implement a deepCopy method on a class
//     maintaining immutability of its instances (instantiated objects)

//   - Copy an object and all of its properties
//     without referencing the same address in memory

//   - deepCopy should return a new object of that type with
//     only the specified properties changed

// Null operator ?? (Null aware operators)

//   - part of the Set of null aware operators

//   - returns the expression (variable) to the left if
//     the expression is not null otherwise
//     returns the expression to the right