// ignore_for_file: unused_field
// TODO: add notes on example and how it compares to modern day coding

class Employee {
  final String name;
  Employee(this.name);

  void printDetails() => print(this.name);
}

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
abstract class ListTraverser<T> {
  final AbstractIterator<T> _iterator;

  ListTraverser(AbstractContainer<T> container) : _iterator = container.iterator;

  bool processItem(T item);

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

class PrintNEmployees extends ListTraverser<Employee> {
  final int _total;
  int _count = 0;

  PrintNEmployees(AbstractContainer<Employee> container, int n)
      : _total = n,
        super(container);

  @override
  bool processItem(Employee emp) {
    final isFinished = (_count >= _total);
    if (!isFinished) {
      emp.printDetails();
      _count++;
      return isFinished;
    }
    return isFinished;
  }
}

void main() {
  final employees = SimpleList<Employee>();
  employees.add(Employee("Ronin"));
  employees.add(Employee("Femi"));
  employees.add(Employee("Nick"));

  final traverser = PrintNEmployees(employees, 1);

  traverser.traverse();
}

// TODO: review and organize notes
// Summary of pattern compared to mordern day
// The GoF Internal Iterator was designed for Side Effects (printing, modifying the existing object in place) or Searching (finding one item). It predates the widespread adoption of functional "Map/Reduce" pipelines in OOP languages, which is why it feels "clunky" for data transformation tasks today.
// The ListTraverser example is not a Functional Map i.e. the collection.map(anonymous function)
// but closer to a Stateful Accumulator (similar to the declarative forEach or reduce)

// Key Concept: Inversion of Control
// Notice the difference in main():
// External Iterator: You write while (it.moveNext()) { ... }. You are pulling data.
// Internal Iterator: You write printer.traverse(). The class pushes data to itself.
// This structure forces the logic (processItem) to be encapsulated within a specific class, rather than floating loosely in the main function.
