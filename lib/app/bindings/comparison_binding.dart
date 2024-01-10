import 'package:flutter_application_1/app/controllers/comparison_controller.dart';
import 'package:get/get.dart';

class ComparisonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComparisonController>(() => ComparisonController());
  }
}
