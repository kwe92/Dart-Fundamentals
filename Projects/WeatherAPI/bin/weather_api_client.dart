// ignore_for_file: unused_local_variable, unused_import

// API Client Class
//  - makes the rest of the app simpler

//

import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiClient {
  static const baseURL = "https://www.metaweather.com/api";
  Future<void> getLocationID(String city) async {
    final locationUrl = Uri.parse("$baseURL/location/search/?query=$city");
    final respose = await http.get(locationUrl);
    print(respose);
  }
}
