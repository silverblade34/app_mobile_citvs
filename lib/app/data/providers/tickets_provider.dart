import 'package:get/get.dart';

const baseUrl = 'http://204.48.17.106:3010';
const apiUrl = 'api/v1';

class TicketsProvider extends GetConnect {
  Future<Response> getDataTickets(
      String token, int campusId, String dateFrom, String dateTo) async {
    try {
      // Enviar la solicitud POST con el payload
      final raw = await post(
        "$baseUrl/$apiUrl/reports/income",
        {
          'campusId': campusId,
          'dateFrom': dateFrom,
          'dateTo': dateTo,
        },
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
