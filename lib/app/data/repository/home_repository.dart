import 'package:citvs/app/data/models/home/response_home.dart';
import 'package:citvs/app/data/providers/home_provider.dart';

HomeProvider homeProvider = HomeProvider();

class HomeRepository {
  Future<ResponseHome> getDataHome(String token) async {
    final response = await homeProvider.getDataHome(token);
  
    // Verificar si response.body es null
    if (response.body == null) { 
      throw Exception("No se recibieron datos en la respuesta");
    }
 
    final body = response.body;
    ResponseHome companiesData = ResponseHome.fromJson(body);
    return companiesData;
  }
}
