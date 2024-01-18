import 'package:flutter/material.dart';
import 'package:citvs/app/bindings/login_binding.dart';
import 'package:citvs/app/routes/pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.MAIN,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      supportedLocales: const [
        Locale('es', 'ES'),
      ],
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
      builder: (context, widget) {
        widget = EasyLoading.init()(context, widget);
        return widget;
      },
    ),
  );
}
