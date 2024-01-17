import 'package:citvs/app/data/models/credential/response_credential.dart';
import 'package:citvs/app/data/providers/login_provider.dart';

LoginProvider loginProvider = LoginProvider();

class LoginRepository {
  Future<ResponseCredential> getDataUser(String username, String password) async {
    final response = await loginProvider.getValidateUser(username, password);

    // Verificar si response.body es null
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    }

    final body = response.body;
    ResponseCredential user = ResponseCredential.fromJson(body);
    return user;
  }
}
