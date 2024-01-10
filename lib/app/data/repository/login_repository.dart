import 'package:flutter_application_1/app/data/models/credential/credential.dart';
import 'package:flutter_application_1/app/data/providers/login_provider.dart';

LoginProvider loginProvider = LoginProvider();

class LoginRepository {
  Future<CredentialUser> getDataUser(String username, String password) async {
    final response = await loginProvider.getValidateUser(username, password);
    final body = response.body;
    CredentialUser user = CredentialUser.fromJson(body);
    return user;
  }
}
