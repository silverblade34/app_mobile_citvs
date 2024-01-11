import 'package:citvs/app/controllers/navigation_layout_controller.dart';
import 'package:get/get.dart';

class NavigationLayoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationLayoutController>(() => NavigationLayoutController());
  }
}
