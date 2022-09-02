// Static Variables & Methods

//    - Are variables and methods that are specific to a class itself
//      rather than instances of a class

class Strings {
  static const welcome = 'Welcome';
  static const signIn = 'Signin';
  static String greeting(var name) => 'Hi, $name';
}

void main() {
  print(Strings.welcome);
  print(Strings.signIn);
  print(Strings.greeting('Goku'));

  // Trying to access a static class method
  // Through an instance of a class will result in error
  /*
  
  Strings c1 = Strings as Strings;
  print(c1.welcome);
  
  */
}
