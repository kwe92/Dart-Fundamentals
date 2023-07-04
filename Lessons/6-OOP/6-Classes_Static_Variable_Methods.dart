// Static Class Variables

//   - class wide state and constant variables
//   - ALL instances share static variables
//     if a getter is implemented

// Static Methods

//   - static methods are specific to the class itself
//   - instances do not have access to
//     static class methods (class wide functions)
//   - attempting to access a static class method
//     through an instance of a class will result in error

class Strings {
  static const welcome = 'Welcome';
  static const signIn = 'Signin';
  static String greeting(var name) => 'Hi, $name';
}

void main() {
  print(Strings.welcome);
  print(Strings.signIn);
  print(Strings.greeting('Goku'));

  /*
  
  Strings c1 = Strings as Strings;
  print(c1.welcome);
  
  */
}
