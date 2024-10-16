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
      : todoId = json['todo_id'],
        todo = json['todo'],
        complete = json['complete'],
        dateComplete = json['date_complete'];

  @override
  String toString() => 'TodoItem(todoId: $todoId, todo: $todo, complete: $complete, dateComplete: $dateComplete)';
}

Future<void> main() async {
  final json = await useFetchTodoApi();

  final todo = TodoItem.fromJSON(json);

  print('Todo Items: $todo');
}

Future<Map<String, dynamic>> useFetchTodoApi() async {
  await Future.delayed(
    Duration(seconds: 1, milliseconds: 200),
  );

  return {
    'todo_id': 1001,
    'todo': 'Study Arabic',
    'complete': true,
    'date_complete': DateTime.now(),
  };
}


// Constant Constructors (Immutable - Stateless Classes)

//   - creates immutable instances of a class known as compile-time constants that are frozen at compile-time

//   - the data within the class never changes once initialized for the first time

//   - all instnace fields (instance variables) non-nullable or nullable must be defined as final creating a stateless object

//   - compile-time constants allow compiler optimizations as the compiler knows that for the lifetime of the program the data within
//     the class will not change

//   - it is a compile-time error to reassign an immutable objects fields to new values once initialized