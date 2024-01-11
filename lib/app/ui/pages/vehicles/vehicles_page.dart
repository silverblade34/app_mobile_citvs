import 'package:flutter/material.dart';
import 'package:citvs/app/ui/pages/vehicles/widgets/type_vehicle.dart';
import 'package:citvs/app/ui/pages/widgets/button_filter.dart';
import 'package:citvs/app/ui/pages/widgets/date_picker.dart';
// -----------------------------Importaciones para los layout----------------------------------
import 'package:citvs/app/ui/pages/widgets/navigation/custom_app_bar.dart';
import 'package:citvs/app/ui/pages/widgets/navigation/custom_bottom_bar.dart';
import 'package:citvs/app/ui/pages/widgets/navigation/navigation_drawer.dart';
//---------------------------------------------------------------------------------------------
import 'package:citvs/app/controllers/vehicles_controller.dart';
import 'package:citvs/app/ui/pages/widgets/text_select.dart';
import 'package:get/get.dart';

class VehiclesPage extends GetView<VehiclesController> {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vehiclesCL = Get.put(VehiclesController());
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerLayout(),
      bottomNavigationBar: const CustomBottomNavigationBar(
        initialIndex: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextSelect(
                      textLabel: "Sede",
                      iconData: Icons.domain,
                    ),
                    Expanded(
                      child: Obx(() => Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 236, 236,
                                  236), // Color de fondo del contenedor
                              borderRadius: BorderRadius.circular(
                                  8), // Bordes redondeados
                            ),
                            // color: Colors.blueAccent,
                            height: 45,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: vehiclesCL.valueLapDropdown.value,
                              underline: Container(color: Colors.transparent),
                              items: vehiclesCL.itemsDropDown,
                              onChanged: (String? newValue) async {
                                if (newValue != null) {
                                  print("--------------2");
                                  print(newValue);
                                  vehiclesCL.valueLapDropdown.value = newValue;
                                }
                              },
                            ),
                          )),
                    ),
                  ],
                ),
                DatePicker(
                  label: "Fecha desde",
                  onChanged: (newDate) {
                    vehiclesCL.dateFrom.value =
                        newDate; // Actualizar fecha desde
                  },
                ),
                DatePicker(
                  label: "Fecha hasta",
                  onChanged: (newDate) {
                    vehiclesCL.dateTo.value = newDate; // Actualizar fecha desde
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonFilter(
                  onTap: () async {
                    await controller.doSearch();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TypeVehicle(
                      label: "Pesado",
                      icon: Icons.directions_bus,
                      quantity: vehiclesCL.heavyVehicleQuantity,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TypeVehicle(
                      label: "Liviano",
                      icon: Icons.directions_car,
                      quantity: vehiclesCL.lightVehicleQuantity,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TypeVehicle(
                      label: "Menor",
                      icon: Icons.two_wheeler,
                      quantity: vehiclesCL.minorVehicleQuantity,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
