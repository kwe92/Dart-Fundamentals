import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_service.dart';

// TODO: handle if the response is an array or error map | check the response type
// TODO: override host and header computed variables
// TODO: comment your code with brevity!

class TaskService extends ApiService {
  Future<dynamic> getAllTasks() async {
    final http.Response response = await get(EndPoint.gettasks.path);
    return jsonDecode(response.body);
  }

  Future<dynamic> getTaskById(int id) async {
    final http.Response response = await get(
      EndPoint.gettask.path + id.toString(),
    );
    return jsonDecode(response.body);
  }

  Future<dynamic> createTask(Map<String, dynamic> task) async {
    final http.Response response = await post(EndPoint.create.path, body: jsonEncode(task));
    return jsonDecode(response.body);
  }
}
































//   Future<http.Response> getAllTasks() async {
//     http.Response response = await get(EndPoint.gettasks.path);
//     return response;
//   }

//   Future<http.Response> getTaskById(int id) async {
//     http.Response response = await get(
//       EndPoint.gettask.path + id.toString(),
//     );
//     return response;
//   }

// TODO: Comment your code!
