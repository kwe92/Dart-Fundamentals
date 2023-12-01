// Inspired by: https://web.mit.edu/6.031/www/fa20/classes/08-immutability/

/// MyIterator: simple parameterized iterator implementation that only works with arrays
class MyIterator<T> {
  late final List<T> _list;

  int _index = 0;

  // return the current index
  int get currentIndex {
    return _index;
  }

  MyIterator({required List<T> list}) {
    this._list = list;
  }

  bool hasNext() {
    return _index < _list.length;
  }

  T next() {
    final element = _list[_index];
    _index++;

    return element;
  }
}

void main() {
  final MyIterator iter0 = MyIterator<int>(list: <int>[1, 1, 2, 3, 5, 8, 13]);

  final MyIterator iter1 = MyIterator<String>(list: <String>["Baki", "Guts", "Naruto", "Griffith", "Gaara"]);

  while (iter0.hasNext()) {
    print("index: ${iter0.currentIndex} | element: ${iter0.next()}");
  }

  while (iter1.hasNext()) {
    print("index: ${iter1.currentIndex} | element: ${iter1.next()}");
  }
}

// TODO: Add Comments about Iterator Design Pattern

// Mutability

//   - ommiting keywords final or const preceeding a variable declaration makes a variable mutable

// Immutability

//   - adding keywords final or const preceeding a variable declaration makes a variable immutable

// final Immutability

//   - can be declared without an inital value
//   - can be initalized at compile-time or run-time once and only once
//   - when a member variable / field is declared but not initalized in the constructor
//     head but in the constructor body it must be prefixed with late


// const Immutability

//   - a compile-time constant that must be declared and initialized with a value at compile-time
//   - this implies that variable declaration and initialization happen simultaneously rather than the variable being initialized later

// Variable and Method Visibility

//   - public variables and methods: no preceding unerscore
//   - private variables and methods: preceding underscore


