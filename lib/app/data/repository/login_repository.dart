import 'package:citvs/app/data/models/credential/credential.dart';
import 'package:citvs/app/data/providers/login_provider.dart';

LoginProvider loginProvider = LoginProvider();

class LoginRepository {
  Future<CredentialUser> getDataUser(String username, String password) async {
    final response = await loginProvider.getValidateUser(username, password);

    // Verificar si response.body es null
    if (response.body == null) {
      // Puedes manejar este caso de acuerdo a tus necesidades
      // Por ejemplo, podrías lanzar una excepción o devolver un valor predeterminado.
      throw Exception("No se recibieron datos en la respuesta");
    }

    final body = response.body;

    // Ahora verificamos si 'data' es null en 'body'
    if (body["data"] == null) {
      // Reemplazar body["data"] con el contenido deseado
      body["data"] = {
        "token": "",
        "id": 0,
        "username": "",
        "password": "",
        "rol": "",
        "status": false,
        "vendor": null,
        "company": {
          "id": 0,
          "name": "",
          "ruc": "",
          "phone": "",
          "email": "",
          "createdAt": "2023-12-05T21:50:34.000Z"
        }
      };
    }

    CredentialUser user = CredentialUser.fromJson(body);
    return user;
  }
}
