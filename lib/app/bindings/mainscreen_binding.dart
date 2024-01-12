import 'package:citvs/app/controllers/mainscreen_controller.dart';
import 'package:get/get.dart';

class MainScreenBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<MainScreenController>(() => MainScreenController());
  }
}