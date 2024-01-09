import 'package:flutter_application_1/app/bindings/home.binding.dart';
import 'package:flutter_application_1/app/bindings/login.binding.dart';
import 'package:flutter_application_1/app/ui/pages/navigation/navigation.layout.dart';
import 'package:flutter_application_1/app/ui/pages/home/home.page.dart';
import 'package:flutter_application_1/app/ui/pages/login/login.page.dart';
import 'package:flutter_application_1/app/ui/pages/splash.page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.NAVIGATION,
      page: () => NavigationLayout(),
    )
  ];
}
