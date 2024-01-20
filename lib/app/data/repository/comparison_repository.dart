import 'package:citvs/app/data/models/comparison/response_comparison.dart';
import 'package:citvs/app/data/providers/comparison_provider.dart';

ComparisonProvider comparisonProvider = ComparisonProvider();

class ComparisonRepository {
  Future<ResponseComparison> getDataComparison(
      String token, String campusId, String typeOfComparison) async {
    final response = await comparisonProvider.getDataComparison(
        token, campusId, typeOfComparison);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    }
    final body = response.body;
    ResponseComparison campusData = ResponseComparison.fromJson(body);
    return campusData;
  }
}
