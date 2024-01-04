import 'package:flutter_application_1/app/ui/pages/login_page.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.LOGIN, page:()=> LoginPage())
  ];
}