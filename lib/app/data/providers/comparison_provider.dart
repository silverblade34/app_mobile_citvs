import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const baseUrl = 'http://204.48.17.106:3010';
const apiUrl = 'api/v1';

class ComparisonProvider extends GetConnect {
  Future<Response> getDataComparison(
      String token, String campusId, String typeOfComparison) async {
    try {
      // Enviar la solicitud POST con el payload
      final raw = await post(
        "$baseUrl/$apiUrl/reports/comparison",
        {"campusId": campusId, "typeOfComparison": typeOfComparison},
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(milliseconds: 8000));
      if (raw.statusCode == 401) {
        GetStorage().erase();
        Get.offAllNamed('/login');
        EasyLoading.showInfo("La sesión ha expirado");
      }
      return raw; // Devuelve la respuesta
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
