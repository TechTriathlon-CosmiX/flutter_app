import 'package:get/get_connect.dart';

class ApiService extends GetConnect {
  // Define the base URL here
  final baseUrl = 'http://localhost:3001/api';

  Future<Response> registerUser(Map<String, dynamic> data) async {
    return post('$baseUrl/auth/register', data);
  }

  Future<Response> loginUser(Map<String, dynamic> data) async {
    return post('$baseUrl/auth/login', data);
  }
}
