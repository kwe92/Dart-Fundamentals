abstract class Set<T> {
  List<T> _elements;

  Map<T, int> get elements;

  Set(this._elements);

  void add(T element);

  void union(Set<T> s);

  Set<T> intersect(Set<T> s);

  @override
  String toString() {
    return elements.toString();
  }

// TODO: fix implementation | not the best
  Set operator [](covariant int index) {
    if (elements.values.contains(index)) {
      return SetImp([elements.keys.toList()[index]]);
    } else {
      return SetImp([]);
    }
  }
}

class SetImp<T> extends Set<T> {
  SetImp(super._elements);

  @override
  Map<T, int> get elements => _listToMap();

  @override
  void add(T element) {
    if (!_elements.contains(element)) {
      _elements.add(element);
    }
  }

  @override
  void union(Set<T> s) {
    for (var element in s.elements.keys) {
      if (!_elements.contains(element)) {
        _elements.add(element);
      }
    }
  }

  @override
  Set<T> intersect(Set<T> s) {
    List<T> intersectedElements = [];

    for (var element in s.elements.keys) {
      if (_elements.contains(element)) {
        intersectedElements.add(element);
      }
    }

    return SetImp(intersectedElements);
  }

  Map<T, int> _listToMap() {
    Map<T, int> setRep = {};
    int setIndex = 0;
    for (int i = 0; i < _elements.length; i++) {
      if (!setRep.containsKey(_elements[i])) {
        setRep.putIfAbsent(_elements[i], () => setIndex++);
      }
    }

    return setRep;
  }
}

void main() {
  final Set<int> set00 = SetImp<int>([1, 1, 1, 1, 2, 2, 3, 4, 5, 5, 5]);

  print(set00);

  set00.add(100);

  print(set00);

  set00.union(SetImp<int>([1, 9, 18, 4, 5, 23]));

  print(set00);

  final Set<int> set01 = set00.intersect(SetImp<int>([1, 200, 99, 42, 4, 5, 23]));

  print("set01: $set01");

  print("set00 index 0: ${set00[8]}");
}
