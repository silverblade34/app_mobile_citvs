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

    // Enviar la solicitud POST con el payload
    return await post(
      "$baseUrl/$apiUrl/auth/login",
      payload,
      contentType: 'application/json', // Asegúrate de establecer el tipo de contenido
    );
  }
}