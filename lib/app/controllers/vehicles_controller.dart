import 'package:citvs/app/data/repository/common_repository.dart';
import 'package:citvs/app/data/repository/vehicles_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class VehiclesController extends GetxController {
  // Llamando al localstorage
  final box = GetStorage();
  CommonRepository commonRepository = CommonRepository();
  VehiclesRepository vehiclesRepository = VehiclesRepository();
  RxString dateFrom = RxString("");
  RxString dateTo = RxString("");

  // Cantidad de vehiculos revisados
  RxInt heavyVehicleQuantity = RxInt(0);
  RxInt lightVehicleQuantity = RxInt(0);
  RxInt minorVehicleQuantity = RxInt(0);
  // Valor del item seleccionado por default en el dropdwon
  RxString valueLapDropdown = RxString('-');

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
    final dataVehicles = await vehiclesRepository.getDataVehicles(
        token, selectedValue, dateFrom.toString(), dateTo.toString());
    heavyVehicleQuantity.value = dataVehicles.data.heavyVehicles;
    lightVehicleQuantity.value = dataVehicles.data.lightVehicles;
    minorVehicleQuantity.value = dataVehicles.data.minorVehicles;
    EasyLoading.dismiss();
  }
}
