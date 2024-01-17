import 'package:get/get.dart';

const baseUrl = 'http://204.48.17.106:3010';
const apiUrl = 'api/v1';

class CommonProvider extends GetConnect {
  Future<Response> getDataCampus(String token) async {
    try {
      // Enviar la solicitud POST con el payload
      final raw = await get(
        "$baseUrl/$apiUrl/campus",
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(milliseconds: 8000));
      return raw; // Devuelve la respuesta
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
