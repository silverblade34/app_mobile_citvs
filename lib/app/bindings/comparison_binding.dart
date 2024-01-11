import 'package:citvs/app/controllers/comparison_controller.dart';
import 'package:get/get.dart';

class ComparisonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComparisonController>(() => ComparisonController());
  }
}
