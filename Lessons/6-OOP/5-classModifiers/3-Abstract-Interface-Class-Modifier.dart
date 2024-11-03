abstract interface class TodoInterface {
  abstract final String id;

  abstract final String todo;

  bool get isComplete;

  String checkTodo();
}

class Todo implements TodoInterface {
  bool _isComplete;

  final String id;

  final String todo;

  bool get isComplete => _isComplete;

  Todo({
    required this.id,
    required this.todo,
    required bool isComplete,
  }) : _isComplete = isComplete;

  @override
  String checkTodo() => todo;
}

void main() {
  final TodoInterface todo = Todo(
    id: '1104',
    todo: 'Do the laundry.',
    isComplete: false,
  );

  final todoItem = todo.checkTodo();

  print("Todo Item: $todoItem");
}

// Combining Class Modifiers - Group Theory

//   - Class modifiers can be combined to create new class modifiers

// Abstract Interface Class - Pure Interface

//   - Combines the class modifiers: abstract && interface

//   - Creates a new pure interface

// Pure Interface

//   - Can not be instantiated (constructed) at all

//   - Can not be extended outside of its own library

//   - Can be implemented outside of its own library