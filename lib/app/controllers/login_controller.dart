import 'package:flutter/material.dart';
import 'package:citvs/app/data/repository/login_repository.dart';
import 'package:citvs/app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  LoginRepository loginRepository = LoginRepository();
  RxBool obscurePass = RxBool(true);

  validateFields() async {
    if (username.text.isEmpty && password.text.isEmpty) {
      EasyLoading.showInfo("Los campos usuario y contraseña están vacios");
    } else if (username.text.isEmpty) {
      EasyLoading.showInfo("Campo usuario vacío");
    } else if (password.text.isEmpty) {
      EasyLoading.showInfo("Campo contraseña vacío");
    } else {
      validateUser();
    }
  }

  validateUser() async {
    final box = GetStorage();
    try {
      final validate =
          await loginRepository.getDataUser(username.text, password.text);
      if (validate.status) {
        box.write("username", validate.data?.username);
        box.write("token", validate.data?.token);
        EasyLoading.show(
            status: 'Cargando...'); // Muestra el indicador de carga
        // Espera un breve período antes de navegar a REVIEWS y cerrar el indicador
        await Future.delayed(
          const Duration(seconds: 1),
        ); // Puedes ajustar el tiempo según sea necesario
        Get.toNamed(Routes.MAIN);
        EasyLoading.dismiss();
      } else {
        EasyLoading.showInfo(validate.message);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
