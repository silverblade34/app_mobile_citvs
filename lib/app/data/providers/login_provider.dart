import 'package:get/get.dart';

const baseUrl = 'http://204.48.17.106:5030';
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

      // Verificar el estado de la respuesta
      if (raw.status.hasError) {
        throw Exception("Error en la solicitud");
      }

      return raw; // Devuelve la respuesta
    } catch (e) {
      throw Exception("Error en la solicitud: catch");
    }
  }
}
