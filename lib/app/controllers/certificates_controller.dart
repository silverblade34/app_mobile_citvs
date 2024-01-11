import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class CertificatesController extends GetxController {
  final box = GetStorage();
  RxString dateFrom = RxString("");
  RxString dateTo = RxString("");
  RxString username = RxString("");
  DateTime selectedDate = DateTime.now();

  RxString valueLapDropdown = RxString('-');
// Declaracion de variables para las cantidad de tipos de resultados de inspección
  RxInt approvedQuantity = RxInt(0);
  RxInt disapprovedQuantity = RxInt(0);
  RxInt voidedQuantity = RxInt(0);

  RxList<DropdownMenuItem<String>> itemsDropDown =
      RxList<DropdownMenuItem<String>>(
    [
      const DropdownMenuItem(
        value: "-",
        child: Text(
          "-",
          textAlign: TextAlign.center,
        ),
      )
    ],
  );

  @override
  void onReady() async {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('dd.MM.yyyy').format(currentDate);

    dateFrom.value = formattedDate;
    dateTo.value = formattedDate;

    // Declaramos los items del dropdown
    List<DropdownMenuItem<String>> itemCampus = [
      const DropdownMenuItem(
        alignment: Alignment.center,
        value: "0",
        child: Text(
          "TODOS",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
      const DropdownMenuItem(
        alignment: Alignment.center,
        value: "ATE",
        child: Text(
          "ATE",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
      const DropdownMenuItem(
        alignment: Alignment.center,
        value: "SANTA ANITA",
        child: Text(
          "SANTA ANITA",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
      const DropdownMenuItem(
        alignment: Alignment.center,
        value: "CHORILLOS",
        child: Text(
          "CHORILLOS",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
    ];
    itemsDropDown.value = itemCampus;
    valueLapDropdown.value = "0";

    await doSearch();
    super.onReady();
  }

  doSearch() async {
    print("--------DENTRO DEL CONTROLLER---------");
    print("SEDE: " + valueLapDropdown.value);
    print("FECHA DESDE: " + dateTo.value);
    print("FECHA HASTA: " + dateFrom.value);
  }
}
