import 'package:get/get.dart';

const baseUrl = 'http://204.48.17.106:3010';
const apiUrl = 'api/v1';

class LoginProvider extends GetConnect {
  Future<Response> getValidateUser(String username, String password) async {
    // Payload para enviar en la solicitud POST
    Map<String, dynamic> payload = {
      'username': username,
      'password': password,
    };

    try {
      // Enviar la solicitud POST con el payload
      final raw = await post("$baseUrl/$apiUrl/auth/login", payload)
          .timeout(const Duration(milliseconds: 8000));
      return raw; // Devuelve la respuesta
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
