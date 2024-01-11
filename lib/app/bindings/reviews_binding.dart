import 'package:citvs/app/controllers/reviews_controller.dart';
import 'package:get/get.dart';

class ReviewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewsController>(() => ReviewsController());
  }
}
