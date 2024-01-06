import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    //VALIDACION SI TIENE PERMISO PARA ENTRAR
    final box = GetStorage();
    bool isLogged = box.read('isLogged') ?? false;

    if (route != Routes.LOGIN) {
      return isLogged ? null : RouteSettings(name: Routes.LOGIN);
    } else {
      return isLogged ? const RouteSettings(name: Routes.HOME) : null;
    }
  }
}

