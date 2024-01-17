import 'package:citvs/app/data/models/campus/response_campus.dart';
import 'package:citvs/app/data/providers/common_provider.dart';

class CommonRepository {
  CommonProvider commonProvider = CommonProvider();

  Future<ResponseCampus> getDataCampus(String token) async {
    final response = await commonProvider.getDataCampus(token);

    // Verificar si response.body es null
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    }

    final body = response.body;
    ResponseCampus campusData = ResponseCampus.fromJson(body);
    return campusData;
  }
}
