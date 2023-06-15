// interface class modifier

//  - interface classes
//    - can not be extended (inherited) outside of the module (library)
//    - can be constructed
//    - can be implemented
//    -
//  - interface classes can be implemented

interface class TodoInterface {
  final String id;
  final String todo;
  final bool isComplete;
  const TodoInterface({
    required this.id,
    required this.todo,
    required this.isComplete,
  });

  void checkTodo() {}
}

class Todo extends TodoInterface {
  const Todo({
    required super.id,
    required super.todo,
    required super.isComplete,
  });
}

void main() {
  const todo = Todo(
    id: '',
    todo: '',
    isComplete: false,
  );

  print(todo.isComplete);
}
