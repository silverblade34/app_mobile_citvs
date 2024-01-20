import 'package:citvs/app/data/models/certificates/response_certificates.dart';
import 'package:citvs/app/data/providers/certificates_provider.dart';

class CertificatesRepository {
  CertificatesProvider certificatesProvider = CertificatesProvider();

 Future<ResponseCertificates> getDataCertificates(
      String token, int campusId, String dateFrom, String dateTo) async {
    final response =
        await certificatesProvider.getDataCertificates(token, campusId, dateFrom, dateTo);

    // Verificar si response.body es null
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    }

    final body = response.body;
    ResponseCertificates certificatesData = ResponseCertificates.fromJson(body);
    return certificatesData;
  }
}
