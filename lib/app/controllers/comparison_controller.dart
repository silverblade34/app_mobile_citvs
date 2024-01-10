import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComparisonController extends GetxController {
  // Valor del item seleccionado por default en el dropdwon
  RxString valueLapDropdown = RxString('-');

  // Año desde:
  RxString selectedYearFrom = RxString('');

  // Año hasta:
  RxString selectedYearTo = RxString('');

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
    print("----------------------------3");
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
  }
}
