// Using Generics with Classes
// Generics Recap:
//      - Allows you to write more readable code
//      - Allows your classes to work with diffrent types

//TODO: Define Stack
// Stack Definition
//    - routing widgets do this as well

class Stack<T> {
  List<T> _list = [];

  void push(T item) {
    _list.add(item);
  }

  T pop() => _list.removeLast();
}

void main() {
  Stack<int> s1 = Stack();
  Stack<String> s2 = Stack();

  s1.push(43);
  s1.push(99);

  s2.push('Edward Elric');
  s2.push('Alphonze Elric');

  print(s1.pop());
  print(s1.pop());

  print(s2.pop());
  print(s2.pop());
}
