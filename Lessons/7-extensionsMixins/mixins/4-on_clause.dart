abstract class ChangeNotifier {
  void notifyListeners() {
    // not a real notification API implementation
    print('I should update my listeners');
  }
}

mixin PasswordMixin on ChangeNotifier {
  String? email;

  String? password;

  String? confirmPassword;

  bool obscurePassword = true;

  bool showRequirements = false;

  void setEmail(String text) {
    email = text;
    // super keyword can be omitted if there are no name conflics
    print('email set to: $email');
    notifyListeners();
  }

  void setPassword(String text) {
    password = text;
    super.notifyListeners();
  }

  void setConfirmPassword(String text) {
    confirmPassword = text;
    super.notifyListeners();
  }

  void setObscurePassword(bool val) {
    obscurePassword = val;
    super.notifyListeners();
  }

  void setShowRequirements(bool val) {
    showRequirements = val;
    notifyListeners();
  }
}

class SignUpViewModel extends ChangeNotifier with PasswordMixin {}

void main() {
  final viewModel = SignUpViewModel();

  print(viewModel.email);

  viewModel.setEmail('baki@grappler.io');

  print(viewModel.email);

  // watch out for implicit setters added to an API with nullable fields
  viewModel.email = 'Yujiro@orge.io';

  print(viewModel.email);
}

// Mixin Dependant on super class

//   - mixins can not extend a super-class but its sub-classes can

//   - if you require a super-classes members (methods or fields) within a mixin you can use the 'on' clause
//     to both use super-class members and ensure all sub-classes of a mixin are also sub-classes of the required super-class
//     or implements the super-classes interface

// Mixin With Nullable Fields

//   - a mixins state can also be managed with nullable fields and method setters as
//     shown in the example above

//   - remember that nullable fields not declared as final have implicit setters
//     added along with an implicit getter