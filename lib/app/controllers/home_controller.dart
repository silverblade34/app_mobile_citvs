import 'package:citvs/app/data/models/home/company_home.dart';
import 'package:citvs/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  HomeRepository homeRepository = HomeRepository();
  final RxList<Company> companies = <Company>[].obs;

  @override
  void onInit() async {
    await updateCompanyData();
    super.onInit();
  }

  updateCompanyData() async {
    final token = box.read("token");
    final companiesData = await homeRepository.getDataHome(token);
    companies.value = companiesData.data;
  }
}
