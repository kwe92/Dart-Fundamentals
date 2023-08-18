import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_service.dart';

class TaskService extends ApiService {
  Future<List<dynamic>> getAllTasks() async {
    http.Response response = await get(EndPoint.gettasks.path);
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getTaskById(int id) async {
    http.Response response = await get(
      EndPoint.gettask.path + id.toString(),
    );
    return jsonDecode(response.body);
  }
}
