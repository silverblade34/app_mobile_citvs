import 'package:citvs/app/data/repository/certificates_repository.dart';
import 'package:citvs/app/data/repository/common_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CertificatesController extends GetxController {
  final box = GetStorage();
  CommonRepository commonRepository = CommonRepository();
  CertificatesRepository certificatesRepository = CertificatesRepository();
  RxString dateFrom = RxString("");
  RxString dateTo = RxString("");

  RxString valueLapDropdown = RxString('-');
// Declaracion de variables para las cantidad de tipos de resultados de inspección
  RxInt approvedQuantity = RxInt(0);
  RxInt disapprovedQuantity = RxInt(0);
  RxInt voidedQuantity = RxInt(0);

  RxList<DropdownMenuItem<String>> itemsDropDown =
      RxList<DropdownMenuItem<String>>([]);

  @override
  void onInit() async {
    final currentDate = DateTime.now();
    dateFrom.value = currentDate.toString().split(" ")[0];
    dateTo.value = currentDate.toString().split(" ")[0];

    final token = box.read("token");
    final campusData = await commonRepository.getDataCampus(token);

    List<DropdownMenuItem<String>> dynamicItems = campusData.data.map((campus) {
      return DropdownMenuItem(
        value: campus.id.toString(),
        child: Text(
          " ${campus.name}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
      );
    }).toList();

    dynamicItems.insert(
      0,
      const DropdownMenuItem(
        value: "0",
        child: Text(
          " SELECCIONAR",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );

    itemsDropDown.value = dynamicItems;
    valueLapDropdown.value = "0";
    super.onInit();
  }

  doSearch() async {
    final token = box.read("token");
    int? selectedValue = int.tryParse(valueLapDropdown.value);

    if (selectedValue == null || selectedValue == 0) {
      EasyLoading.showInfo("Selecciona una sede");
      return;
    }
    EasyLoading.show(status: 'Cargando...');
    final dataCertificates = await certificatesRepository.getDataCertificates(
        token, selectedValue, dateFrom.toString(), dateTo.toString());
    approvedQuantity.value = dataCertificates.data.approvedInspections;
    disapprovedQuantity.value = dataCertificates.data.failedInspections;
    voidedQuantity.value = dataCertificates.data.canceledInspections;
    EasyLoading.dismiss();
  }
}
