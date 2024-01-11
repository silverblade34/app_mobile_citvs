import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<CompanyData> companies = [
    CompanyData(
      billingAmount: RxInt(100),
      numberOfInspections: RxInt(400),
      company: RxString('Company A'),
    ),
    CompanyData(
      billingAmount: RxInt(200),
      numberOfInspections: RxInt(300),
      company: RxString('Company B'),
    ),
    // Agrega más datos según sea necesario
  ];
}

class CompanyData {
  final RxInt billingAmount;
  final RxInt numberOfInspections;
  final RxString company;

  CompanyData({
    required this.billingAmount,
    required this.numberOfInspections,
    required this.company,
  });
}
