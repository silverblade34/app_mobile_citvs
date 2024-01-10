import 'package:flutter_application_1/app/controllers/navigation.layout.controller.dart';
import 'package:get/get.dart';

class NavigationLayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationLayoutController>(() => NavigationLayoutController());
  }
}
