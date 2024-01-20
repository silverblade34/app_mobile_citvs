import 'package:citvs/app/data/repository/common_repository.dart';
import 'package:citvs/app/data/repository/tickets_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TicketsController extends GetxController {
  // Llamando al localstorage
  final box = GetStorage();
  CommonRepository commonRepository = CommonRepository();
  TicketsRepository ticketsRepository = TicketsRepository();
  RxString dateFrom = RxString("");
  RxString dateTo = RxString("");
  // Boletas emitidas
  RxInt ballotsIssued = RxInt(0);
  // Facturas emitidas
  RxInt issuedInvoices = RxInt(0);
  // Ganancia total
  RxDouble totalProffit = RxDouble(0.0);
  RxString valueLapDropdown = RxString("0");

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
        value: campus.id.toString(), // Id como valor del DropdownMenuItem
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
    final dataTickets = await ticketsRepository.getDataTickets(
        token, selectedValue, dateFrom.toString(), dateTo.toString());
    ballotsIssued.value = dataTickets.data.numberOfTickets;
    issuedInvoices.value = dataTickets.data.numberOfInvoices;
    totalProffit.value = dataTickets.data.totalIncome;
    EasyLoading.dismiss();
  }
}
