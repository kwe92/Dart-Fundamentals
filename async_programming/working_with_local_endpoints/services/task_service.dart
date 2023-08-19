import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_service.dart';

class TaskService extends ApiService {
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

  //!--------------------The Below Functions Return Data------------------------!//

  // TODO: handle if the response is an array or error map | check the response type

  Future<dynamic> getAllTasks() async {
    http.Response response = await get(EndPoint.gettasks.path);
    return jsonDecode(response.body);
  }

  Future<dynamic> getTaskById(int id) async {
    http.Response response = await get(
      EndPoint.gettask.path + id.toString(),
    );
    return jsonDecode(response.body);
  }
}

// TODO: Comment your code!
