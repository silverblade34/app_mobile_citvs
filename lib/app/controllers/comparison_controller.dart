import 'package:citvs/app/data/models/comparison/comparison.dart';
import 'package:citvs/app/data/models/comparison/header.dart';
import 'package:citvs/app/data/repository/common_repository.dart';
import 'package:citvs/app/data/repository/comparison_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ComparisonController extends GetxController {
  final box = GetStorage();
  CommonRepository commonRepository = CommonRepository();
  ComparisonRepository comparisonRepository = ComparisonRepository();
  RxString valueCampusDropdown = RxString('0');
  RxString beforeValue = RxString('');
  RxString valueTypeComparison = RxString('0');
  RxString valueTypeGraphic = RxString('TABLE');
  RxList<Comparison> dataComparison = <Comparison>[].obs;
  Rx<Header> dataHeaders = Header(
    monthName: '', // Proporciona valores iniciales adecuados
    firstYear: '',
    intermediateYear: '',
    lastYear: '',
  ).obs;

  RxList<DropdownMenuItem<String>> itemsCampus =
      RxList<DropdownMenuItem<String>>(
    [],
  );

  RxList<DropdownMenuItem<String>> itemsTypeComparison =
      RxList<DropdownMenuItem<String>>(
    [
      const DropdownMenuItem(
        value: "0",
        child: Text(
          "SELECCIONAR",
          textAlign: TextAlign.center,
        ),
      ),
      const DropdownMenuItem(
        value: "INSPECCION",
        child: Text(
          "INSPECCION",
          textAlign: TextAlign.center,
        ),
      ),
      const DropdownMenuItem(
        value: "FACTURACION",
        child: Text(
          "FACTURACION",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );

  RxList<DropdownMenuItem<String>> itemsTypeGraphic =
      RxList<DropdownMenuItem<String>>(
    [
      const DropdownMenuItem(
        value: "CHART",
        child: Text(
          "GRAFICO",
          textAlign: TextAlign.center,
        ),
      ),
      const DropdownMenuItem(
        value: "TABLE",
        child: Text(
          "TABLA",
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );

  @override
  void onReady() async {
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

    itemsCampus.value = dynamicItems;
    valueTypeGraphic.value = "TABLE";
    valueCampusDropdown.value = "0";
    valueTypeComparison.value = "0";
    beforeValue.value = "";
    EasyLoading.show(status: 'Cargando...');
    final response = await comparisonRepository.getDataComparison(
        token, valueCampusDropdown.value, valueTypeComparison.value);
    dataComparison.value = response.data.comparison;
    dataHeaders.value = response.data.header;
    if (valueTypeComparison.value == "INSPECCION") {
      beforeValue.value = "";
    } else if (valueTypeComparison.value == "FACTURACION") {
      beforeValue.value = "S/. ";
    }
    EasyLoading.dismiss();
    super.onReady();
  }

  doSearch() async {
    if (valueCampusDropdown.value == "0" || valueTypeComparison.value == "0") {
      EasyLoading.showInfo("Selecciona una sede y tipo de comparación");
      return;
    }
    final token = box.read("token");
    EasyLoading.show(status: 'Cargando...');
    final response = await comparisonRepository.getDataComparison(
        token, valueCampusDropdown.value, valueTypeComparison.value);
    dataComparison.value = response.data.comparison;
    dataHeaders.value = response.data.header;
    if (valueTypeComparison.value == "INSPECCION") {
      beforeValue.value = "";
    } else if (valueTypeComparison.value == "FACTURACION") {
      beforeValue.value = "S/. ";
    }
    EasyLoading.dismiss();
  }
}
