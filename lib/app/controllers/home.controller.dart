import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();

  @override
  void onReady() {
    // TODO: implement onReady
    print("---------------------");
    print(box.read("username"));
    print("---------------------");
    super.onReady();
  }
}
