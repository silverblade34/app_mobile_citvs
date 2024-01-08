import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReviewsController extends GetxController {
  final box = GetStorage();
  RxString username = RxString("");

  @override
  void onReady() async {
    // TODO: implement onReady
    print("--------------------1");
    username.value = box.read("username");
    print(username.value);
    super.onReady();
  }
}
