// Constant Classes (Immutable - Stateless)

//   - classes that are compile-time constants (frozen at compile-time)
//   - the data within the class never changes
//   - the compiler knows that for the lifetime of the program the data within
//     will not change requiring the compiler to do less guess work
//   - all variables in the class are final (frozen / immutable once initalized)
//     creating a stateless object

Future<Map<String, dynamic>> useFetchTodoApi() async {
  await Future.delayed(
    Duration(seconds: 1, milliseconds: 200),
  );

  return {
    'todoId': 1001,
    'todo': 'Study Arabic',
    'complete': true,
    'dateComplete': DateTime.now(),
  };
}

class TodoItem {
  final int todoId;
  final String todo;
  final bool complete;
  final DateTime dateComplete;

  const TodoItem({
    required this.todoId,
    required this.todo,
    required this.complete,
    required this.dateComplete,
  });

  TodoItem.fromJSON(Map<String, dynamic> json)
      : todoId = json['todoId'],
        todo = json['todo'],
        complete = json['complete'],
        dateComplete = json['dateComplete'];

  @override
  String toString() => 'TodoItem(todoId: $todoId, todo: $todo, complete: $complete, dateComplete: $dateComplete)';
}

Future<void> main() async {
  final Map<String, dynamic> json = await useFetchTodoApi();
  final TodoItem todo = TodoItem.fromJSON(json);

  print('Todo Items: $todo');
}
