import 'package:flutter/material.dart';
import 'package:citvs/app/bindings/login_binding.dart';
import 'package:citvs/app/controllers/navigation_layout_controller.dart';
import 'package:citvs/app/routes/pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Get.put(NavigationLayoutController()); 
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.teal,
    ),
    initialBinding: LoginBinding(),
    getPages: AppPages.pages,
    builder: (context, widget) {
      widget = EasyLoading.init()(context, widget);
      return widget;
    },
  ));
}
