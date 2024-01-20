import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const baseUrl = 'http://204.48.17.106:3010';
const apiUrl = 'api/v1';

class CertificatesProvider extends GetConnect {
 Future<Response> getDataCertificates(
      String token, int campusId, String dateFrom, String dateTo) async {
    try {
      // Enviar la solicitud POST con el payload
      final raw = await post(
        "$baseUrl/$apiUrl/reports/certificates",
        {
          'campusId': campusId,
          'dateFrom': dateFrom,
          'dateTo': dateTo,
        },
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
