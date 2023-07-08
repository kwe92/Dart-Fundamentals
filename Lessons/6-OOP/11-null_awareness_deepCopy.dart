// Custom Deep Copy Method: Maintaining Immutablility

//   - You can implement your own deep copy method to maintain immutability
//   - Allowing you to copy an object and all its properties
//     without the need to reference the same address in memory
//     returning a new object of that type with only
//     the passed in properties changed

// Null operator ??

//   - part of the Set of null aware operators
//   - returns the expression to the left if it is not null
//     otherwise returns the expression to the right

class UserCredentials {
  final String userName, userEmail, userPassword;
  final bool isAdmin;

  const UserCredentials({
    required this.userName,
    required this.userPassword,
    required this.userEmail,
    required this.isAdmin,
  });

  UserCredentials copyWith({
    String? userName,
    String? userPassword,
    String? userEmail,
    bool? isAdmin,
  }) =>
      UserCredentials(
        userName: userName ?? this.userName,
        userPassword: userPassword ?? this.userPassword,
        userEmail: userEmail ?? this.userEmail,
        isAdmin: isAdmin ?? this.isAdmin,
      );

  @override
  String toString() => """
UserCredentials(
  userName: ${this.userName},
  userPassword: ${this.userPassword},
  userEmail: ${this.userEmail},
  isAdmin: ${this.isAdmin},
  )
""";
}

void main() {
  final user = UserCredentials(
    userName: 'Gaara',
    userPassword: 'SandKing',
    userEmail: 'kingofsand@naruto.anime',
    isAdmin: true,
  );

  final UserCredentials updatedUser = user.copyWith(
    userPassword: '1TailedSandDemonKing',
  );

  final UserCredentials anotherUpdate = updatedUser.copyWith(userEmail: 'HiddenInTheSand@naruto.anime');

  print('\nCurrent user credentials:\n\n$user\n');

  print('\nFirst update user credentials:\n\n$updatedUser\n');

  print('\nSecond update user credentials:\n\n$anotherUpdate\n');
}
