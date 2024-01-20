import 'package:citvs/app/data/models/vehicles/response_vehicles.dart';
import 'package:citvs/app/data/providers/vehicles_provider.dart';

class VehiclesRepository {
  VehiclesProvider vehiclesProvider = VehiclesProvider();

 Future<ResponseVehicles> getDataVehicles(
      String token, int campusId, String dateFrom, String dateTo) async {
    final response =
        await vehiclesProvider.getDataVehicles(token, campusId, dateFrom, dateTo);

    // Verificar si response.body es null
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    }

    final body = response.body;
    ResponseVehicles vehiclesData = ResponseVehicles.fromJson(body);
    return vehiclesData;
  }
}
