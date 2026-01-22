// Standard External Iterator Example
// TODO: add notes on example and how it compares to modern day coding
class Employee {
  final String name;
  Employee(this.name);
}

class MyList<T> {
  List<T> _items = [];

  GoFIterator<T> get iterator => ListIterator<T>(this);

  void add(T element) => _items.add(element);
  int count() => _items.length;
  T get(int index) => _items[index];
}

abstract class GoFIterator<T> {
  void first();
  void next();
  bool isDone();
  T currentltem();
}

class ListIterator<T> implements GoFIterator<T> {
  final MyList<T> _list;
  int _current;

  ListIterator(MyList<T> aList)
      : _list = aList,
        _current = 0;

  @override
  T currentltem() => _list.get(_current);

  @override
  void first() => _current = 0; // used in the initialization step of a for loop to reset the iterator

  @override
  bool isDone() => _current >= _list.count();

  @override
  void next() => _current++;
}

void main() {
  final MyList<Employee> employees = MyList();
  employees.add(Employee("Ronin"));
  employees.add(Employee("Femi"));
  employees.add(Employee("Nick"));

  final GoFIterator<Employee> iter = employees.iterator;

  while (!iter.isDone()) {
    print(iter.currentltem().name);
    iter.next();
  }
}
