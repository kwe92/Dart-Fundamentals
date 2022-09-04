// Extends vs Implements

abstract class InterfaceA {
  void a(); // Abstract method that has a function head and no function body
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

abstract class Base {
  void foo(); // abstract method
  void bar() => print('bar'); // Concrete Method
}

// Abstract methods in a abstract must be overridden implemented
class SubClass extends Base {
  @override
  void foo() => 'Hello!';
}

// All methods in a abstract class must be overridden if implements is used

/*

class SubClass2 implements Base {
  @override
  void foo() => 'Universe!';
}

*/

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
