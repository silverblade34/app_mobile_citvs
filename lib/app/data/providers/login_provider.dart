import 'package:get/get.dart';

const baseUrl = 'http://204.48.17.106:3010';
const apiUrl = 'api/v1';

class LoginProvider extends GetConnect {
  Future<Response> getValidateUser(String username, String password) async {
    Map<String, dynamic> payload = {
      'username': username,
      'password': password,
    };

    try {
      final raw = await post("$baseUrl/$apiUrl/auth/login", payload)
          .timeout(const Duration(milliseconds: 8000));
      return raw; 
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
