// ignore_for_file: unused_catch_stack

import '../../utility/spacedPrint.dart';
import 'services/task_service.dart';

Future<void> main() async {
  final taskService = TaskService();

  final allTasks = await taskService.getAllTasks();
  final task = await taskService.getTaskById(1005);

  spacedPrint(
    'All Tasks: \n\n$allTasks',
    prefix_space: true,
  );

  spacedPrint('Task by id:\n\n$task');
}

// TODO: Review | Just review the whole package
// HttpHeaders.contentTypeHeader: "application/json"
// Dart Enhanced Enum
// headers
// hosts
// json decoding and encoding