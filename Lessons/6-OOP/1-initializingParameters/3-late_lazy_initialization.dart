import 'dart:convert';

import 'package:http/http.dart';

TodoService get todoService => TodoService();

// Data Transfer / Domain Object
class Todo {
  final int id;
  final String title;
  final String? content;

  Todo({
    required this.id,
    required this.title,
    this.content,
  });

  Todo.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'];

  @override
  String toString() => 'Todo(id: $id, title: $title, content: $content)';
}

// Service to interact with the backend database
class TodoService {
  Future<List<Map<String, Object?>>> fetchTodos() async {
    print('fetching todo items from backend...');
    await Future.delayed(const Duration(seconds: 2));

    final response = Response(
        '[{"id":1101, "title":"Code 6 Hours","content":"refactor dart foundation lession and work on learning new packages"},{"id":1102, "title":"Clean","content":"Kitchen, your room, and Ronins room"},{"id":1103, "title":"Go to Gym","content":"back and shoulders"},{"id":1104, "title":"Watch Anime"}]',
        200);

    if (response.statusCode == 200) {
      final List responseBody = jsonDecode(response.body);

      // down-cast dynamic List
      final result = List<Map<String, Object?>>.from(responseBody);

      // print(result);

      print('todo items fetched successfully...');

      return result;
    }
    print('todo items were not fetched successfully...');

    return [];
  }
}

// represents the data that will be presented in the view / presentation layer
class TodoViewModel {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  // defer the initialization of todos until runtime
  late final List<Todo> todos;

  TodoViewModel() {
    initalize();
  }

  Future<void> initalize() async {
    setBusy(true);
    todos = [for (var json in await todoService.fetchTodos()) Todo.fromJSON(json)];
    setBusy(false);
  }

  void setBusy(bool isBusy) {
    _isBusy = isBusy;
    // notify listeners if any
  }
}

Future<void> main() async {
  final viewModel = TodoViewModel();

  try {
    // trying to access a late final field before it has been initialized will result in a run-time error
    print(viewModel.todos);
  } catch (err, _) {
    print(err.toString());
  } finally {
    while (viewModel.isBusy) {
      // add delay to not print thousands of lines
      await Future.delayed(const Duration(milliseconds: 500));

      print('waiting for TodoViewModel to load data...');
    }

    print('todo items in view model: ${viewModel.todos}');
  }
}

// late Modifier

//   - enforces a variables constraints at runtime instead of compile-time

//   - verify that a variable has the correct type at runtime

//   - lets you delay / defer initialization and retain null safety as you can not assign null to a
//     non-nullable late variable

//   - late instance fields have access to 'this'

// late final Variables

//   - you do not have to initialize late final fields, defering initialization until run-time

//   - retain the ability to have a variable assigned once and immutable afterwards

// Similar Concepts in Kotlin and Swift

//   - lateinit modifier in Kotlin

//   - lazy modifier in Swift

// late modifier use cases:

//   - declaring a non-nullable variable that's initialized at runtime

//   - lazily initializing a variable

// late Lazy Initialization

//   - late instance fields with initializers are lazily evaluated and ran the first time the
//     field is accessed rather than when the instance is constructed

//   - you can also access this, call methods and access fields on late instance variables

//   - can be used with local variables to have local lazy evaluation

// late Lazy Initialization Use Cases:

//   - when initializing the variable is costly (computationally expensive)

//   - instance variable needs access to 'this's