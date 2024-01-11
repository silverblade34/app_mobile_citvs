import 'package:citvs/app/data/models/credential/credential.dart';
import 'package:citvs/app/data/providers/login_provider.dart';

LoginProvider loginProvider = LoginProvider();

class LoginRepository {
  Future<CredentialUser> getDataUser(String username, String password) async {
    final response = await loginProvider.getValidateUser(username, password);
    final body = response.body;
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
