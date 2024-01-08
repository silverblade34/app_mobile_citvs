import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/reviews.controller.dart';
import 'package:get/get.dart';

class ReviewsPage extends GetView<ReviewsController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() => Column(
              children: [
                Text("Hola ${controller.username.value}"),
                Text("Estamos en revisiones tecnicas realizadas en el día"),
                
              ],
            )),
      )),
    );
  }
}
