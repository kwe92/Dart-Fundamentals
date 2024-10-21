// ignore_for_file: unused_local_variable

class TodoItem {
  final int todoId;
  final String todo;
  final bool complete;
  final DateTime? dateComplete;

  const TodoItem({
    required this.todoId,
    required this.todo,
    required this.complete,
    this.dateComplete,
  });

  // named constructor with fields initialized with an initializer list
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

  // non-constant named constructor invoked
  final todo = TodoItem.fromJSON(json);

  // Canonical Instance Example

  // constant Generative Constructor call: identical compile-time constant
  const todoConstantObject00 = TodoItem(
    todoId: 9999,
    todo: 'code 6 hours',
    complete: false,
    dateComplete: null,
  );

  // constant Generative Constructor call: identical compile-time constant
  const todoConstantObject01 = TodoItem(
    todoId: 9999,
    todo: 'code 6 hours',
    complete: false,
    dateComplete: null,
  );

  print('todoConstantObject00 hashcode: ${todoConstantObject00.hashCode}');

  print('todoConstantObject01 hashcode: ${todoConstantObject01.hashCode}');

  // Canonical Instance: two separate objects being equal to one another
  print(todoConstantObject00 == todoConstantObject01);
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

//   - must be invoked in a constant context (const keyword used) or a non-constant object will be created losing compiler optimizations

//   - compile-time constants invoked in a constant context allow compiler optimizations
//     as the compiler knows that for the lifetime of the program the data within the class will not change

//   - if a constant constructor is outside of a constant context and is invoked without the const keyword
//     it creates a non-constant object even if the constructor is constant

//   - it is a compile-time error to reassign an immutable objects fields to new values once initialized
//     even if one of those fields points to a collection

// Canonical Instance

// Constructing two identical compile-time constants results in a single, canonical instance