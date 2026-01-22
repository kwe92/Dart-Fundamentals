// ignore_for_file: unused_field

// TODO: add notes on example and how it compares to modern day coding

// Pure Interface
abstract class AbstractIterator<T> {
  T get current;

  void first();
  void next();
  bool isDone();
}

// Pure Interface
abstract class AbstractContainer<T> {
  AbstractIterator<T> get iterator;

  void add(T item);
}

// Abstract Base Class
abstract class FilterListTraverser<T> {
  final AbstractIterator<T> _iterator;

  FilterListTraverser(AbstractContainer<T> container) : _iterator = container.iterator;

  bool processItem(T item);

  bool testItem(T item);

  void traverse() {
    for (_iterator.first(); !_iterator.isDone(); _iterator.next()) {
      bool isFinished = processItem(_iterator.current);
      if (isFinished) break;
    }
  }
}

class SimpleList<T> implements AbstractContainer<T> {
  final List<T> _items = [];

  @override
  AbstractIterator<T> get iterator => SimpleListIterator(this);

  int get length => _items.length;

  @override
  void add(T item) => _items.add(item);

  T at(int index) => _items[index];
}

class SimpleListIterator<T> implements AbstractIterator<T> {
  final SimpleList<T> _items;
  int _index = 0;

  SimpleListIterator(SimpleList<T> items) : _items = items;

  @override
  T get current => _items.at(_index);

  @override
  void first() => _index = 0; // reset the iterator to be used again

  @override
  bool isDone() => _index >= _items.length;

  @override
  void next() => _index++;
}

class MultiplyOddNumber extends FilterListTraverser<int> {
  final int _multiple;
  int _count = 0;

  MultiplyOddNumber(AbstractContainer<int> container, int n)
      : _multiple = n,
        super(container);

  @override
  bool processItem(int n) {
    if (testItem(n)) {
      print('$n is an odd number being multiplied by: $_multiple.');
      print('$n x $_multiple = ${n * _multiple}');
    } else {
      print('$n is an even number.');
    }
    return false;
  }

  @override
  bool testItem(int n) {
    return n % 2 == 1;
  }
}

void main() {
  final numbers = SimpleList<int>();
  numbers.add(0);
  numbers.add(1);
  numbers.add(2);
  numbers.add(3);
  numbers.add(4);
  numbers.add(5);
  numbers.add(6);
  numbers.add(7);

  final traverser = MultiplyOddNumber(numbers, 3);

  traverser.traverse();
}
