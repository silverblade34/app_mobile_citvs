import 'package:flutter_application_1/app/controllers/reviews.controller.dart';
import 'package:get/get.dart';

class ReviewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewsController>(() => ReviewsController());
  }
}
