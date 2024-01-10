import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class TicketsController extends GetxController {
  // Llamando al localstorage
  final box = GetStorage();

  RxString dateFrom = RxString("");
  RxString dateTo = RxString("");
  // Boletas emitidas
  RxInt ballotsIssued = RxInt(0);

  // Facturas emitidas
  RxInt issuedInvoices = RxInt(0);

  // Anulaciones emitidas
  RxInt cancellationsIssued = RxInt(0);

  // Ganancia total
  RxInt totalProffit = RxInt(0);

  DateTime selectedDate = DateTime.now();

  // Valor del item seleccionado por default en el dropdwon
  RxString valueLapDropdown = RxString('-');

  // Declaración estructura items dropdown
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
    // Insertando elementos para el dropdown por default
    List<DropdownMenuItem<String>> itemCampus = [
      const DropdownMenuItem(
        alignment: Alignment.center,
        value: "0",
        child: Text(
          "SELECCIONAR",
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
    super.onReady();
  }

  doSearch() async {
    print("--------DENTRO DEL CONTROLLER---------");
    print("SEDE: " + valueLapDropdown.value);
    print("FECHA DESDE: " + dateTo.value);
    print("FECHA HASTA: " + dateFrom.value);
  }
}
