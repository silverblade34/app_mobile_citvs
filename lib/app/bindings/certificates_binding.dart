import 'package:citvs/app/controllers/certificates_controller.dart';
import 'package:get/get.dart';

class CertificatesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CertificatesController>(() => CertificatesController());
  }
}
