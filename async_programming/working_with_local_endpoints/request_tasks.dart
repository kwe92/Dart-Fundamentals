import 'services/task_service.dart';

Future<void> main() async {
  final taskService = TaskService();

  await taskService.getAllTasks();
  await taskService.getTaskById(1005);
  await taskService.createTask({
    "taskName": "Welcome The Void, Welcome The Pheonix",
    "taskDetails":
        "Moment by moment, rest in the void;\nThe universal mind;\nBurn away what is not pure;\nWhat is not born from love and compassion;\nFor oneself, for humanity as you are one.",
    "createdDate": "2023-08-19",
  });
}


































// TODO: Review: 
// http package
// HttpHeaders.contentTypeHeader: "application/json" // done
// Dart Enhanced Enum
// headers
// hosts
// json decoding and encoding