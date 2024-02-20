class Counter {
  int _count = 0;

  int get count => _count;

  static final Counter _counter = Counter._internal();

  factory Counter.instance() {
    return _counter;
  }

  Counter._internal();

  void increment() => _count++;
}

Counter get singletonCounter => Counter.instance();
