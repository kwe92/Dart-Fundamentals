// Extends vs Implements

// TODO: Absract vs Concrete Methods
// TODO: Add more Comments

abstract class InterfaceA {
  void a();
}

abstract class InterfaceB {
  void b();
}

// Implements allows you to implement multiple interfaces rather than just one
class AB implements InterfaceA, InterfaceB {
  @override
  void a() {}

  @override
  void b() {}
}

// A class can only extend one interface
// Uncommenting the bellow cod will result if failure

/*

class AB extends InterfaceA, InterfaceB{

  @override
  void a(){}

  @override
  void b(){}

}

*/

abstract class Base {
  void foo(); // abstract method
  void bar() => print('bar'); // Concrete Method
}
// TODO: Explain why this fails
// class SubClass extends Base {}

// class SubClass2 implements Base {}
