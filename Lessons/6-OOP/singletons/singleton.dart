class Counter {
  int _count = 0;

  int get count => _count;

  static final Counter _counter = Counter._internal();

  factory Counter() => _counter;

  Counter._internal();

  void increment() => _count++;
}
