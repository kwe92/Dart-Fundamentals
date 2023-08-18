import 'dart:math';

//TODO: this is wrong and shouldbe be used also singletons are not really good to use in practice most of the time as they are hard to test

class SingletonExample {
  static final SingletonExample _instance = SingletonExample();
  factory SingletonExample() {
    return _instance;
  }
  int someNumber;
  SingletonExample.Num([this.someNumber = 0]) {
    Random randInt = Random();
    someNumber = randInt.nextInt(9999);
  }
}
