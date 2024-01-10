import 'package:flutter_application_1/app/controllers/tickets_controller.dart';
import 'package:get/get.dart';

class TicketsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<TicketsController>(() => TicketsController());
  }
}