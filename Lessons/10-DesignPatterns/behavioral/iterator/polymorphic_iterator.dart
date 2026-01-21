// ignore_for_file: unused_field
// TODO: add notes on Polymorphic external iterator, also what makes this example polymorphic

abstract class AbstractIterator<T> {
  T get current; // the current item

  void first();
  void next();
  bool isDone();
}

abstract class AbstractContainer<T> {
  AbstractIterator<T> get iterator;
  void add(T item);
}

class SimpleList<T> implements AbstractContainer<T> {
  final List<T> _items = [];
  int get length => _items.length;

  @override
  AbstractIterator<T> get iterator => SimpleListIterator(this);

  @override
  void add(T item) => _items.add(item);

  T at(int index) => _items[index];
}

class SimpleListIterator<T> implements AbstractIterator<T> {
  final SimpleList<T> _list;
  int _index = 0;

  SimpleListIterator(SimpleList<T> simpleList) : _list = simpleList;

  @override
  T get current => _list.at(_index);

  @override
  void first() => _index = 0;

  @override
  bool isDone() => _index >= _list.length;

  @override
  void next() => _index++;
}

class DictContainer<T> implements AbstractContainer<T> {
  final Map<int, T> _data = {};

  @override
  void add(T item) => _data[_nextKey()] = item;

  @override
  AbstractIterator<T> get iterator => DictContainerIterator(this);

  int size() => _data.length;

  T? lookup(int key) => _data[key];

  int _nextKey() => _data.keys.length > 0 ? _data.keys.last + 1 : 0;
}

class DictContainerIterator<T> implements AbstractIterator<T> {
  final DictContainer<T> _items;
  int _currentKey = 0;

  DictContainerIterator(DictContainer<T> items) : _items = items;

  @override
  T get current => _items.lookup(_currentKey)!;

  @override
  void first() => _currentKey = 0; // reset iterator

  @override
  bool isDone() => _currentKey >= _items.size();

  @override
  void next() => _currentKey++;
}

void printAllItems<T>(AbstractContainer<T> container) {
  final iterator = container.iterator;

  while (!iterator.isDone()) {
    print('current item: ${iterator.current}');
    iterator.next();
  }
}

void main() {
  final listContainer = SimpleList();
  final dictContainer = DictContainer();

  listContainer.add("Alpha");
  listContainer.add("Bravo");

  dictContainer.add("Charlie");
  dictContainer.add("Delta");

  printAllItems(listContainer);

  printAllItems(dictContainer);
}

// Summary of the Code Changes: Standard Iterator vs Polymorphic Iterator

// Feature	Standard Example	                            Polymorphic Example

//   Collection Type	MyList (Concrete)	                      | AbstractContainer (Abstract/Interface)

//   Iterator Type	GoFIterator (Abstract)	                  | AbstractIterator (Abstract)

//   Client Usage	main manually loops over a specific List.	  | printAllItems loops over any Container.

//   Polymorphism	Low (Only the Iterator is abstract).	      | High (Both the Container and Iterator are abstract).
