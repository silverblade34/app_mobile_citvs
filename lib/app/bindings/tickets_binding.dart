import 'package:citvs/app/controllers/tickets_controller.dart';
import 'package:get/get.dart';

class TicketsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<TicketsController>(() => TicketsController());
  }
}