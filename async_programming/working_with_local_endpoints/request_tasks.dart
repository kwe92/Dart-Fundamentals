import 'models/TaskModel.dart';
import 'services/task_service.dart';

Future<void> main() async {
  final taskService = TaskService();

  final task0 = TaskModel.fromJson({
    "id": "1001",
    "taskName": "Be Efficient",
    "taskDetails": "Aim for effieciency over quickness and you will find speed in effieciency as you will avoid many errors.",
    "createdDate": "08-22-2023",
  });

  final allTasks = await taskService.getAllTasks();

  print('\nAll Tasks Run Time Type: \n\n${allTasks.runtimeType}');

  await taskService.getTaskById(1005);

  await taskService.createTask({
    "taskName": "Welcome The Void, Welcome The Pheonix",
    "taskDetails":
        "Moment by moment, rest in the void;\nThe universal mind;\nBurn away what is not pure;\nWhat is not born from love and compassion;\nFor oneself, for humanity as you are one.",
  });

  await taskService.updateTask(
    task0.toJson(),
  );

  await taskService.deleteTask(1002);

  // await taskService.deleteTask(26);
}


































// TODO: Review: 
// http package
// HttpHeaders.contentTypeHeader: "application/json" // done
// Dart Enhanced Enum
// headers
// hosts
// json decoding and encoding