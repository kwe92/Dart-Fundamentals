import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_service.dart';

// TODO: handle if the response is an array or error map | check the response type

class TaskService extends ApiService {
  @override
  String get host => "http://127.0.0.1:8082";

  @override
  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: "application/json",
      };

  /// getAllTasks requests all tasks from the server.

  Future<dynamic> getAllTasks() async {
    final http.Response response = await get(EndPoint.gettasks.path);
    return jsonDecode(response.body);
  }

  /// getTaskById request a task by id from the server.

  Future<dynamic> getTaskById(int id) async {
    final http.Response response = await get(
      EndPoint.gettask.path + id.toString(),
    );
    return jsonDecode(response.body);
  }

  /// createTask requests to add a task to the server and receives a response of all tasks.

  Future<dynamic> createTask(Map<String, dynamic> task) async {
    final http.Response response = await post(
      EndPoint.create.path,
      body: jsonEncode(task),
    );
    return jsonDecode(response.body);
  }
}

/// EndPoint is an enumerated list of all task endpoints.
///
enum EndPoint {
  gettasks("/gettasks"),

  gettask("/gettask/"),

  create("/create"),

  update("/update/"),

  delete("/delete/");

  final String path;

  const EndPoint(this.path);
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
