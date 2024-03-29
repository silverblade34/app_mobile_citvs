import 'package:flutter/material.dart';
import 'package:citvs/app/ui/pages/vehicles/widgets/type_vehicle.dart';
import 'package:citvs/app/ui/pages/widgets/button_filter.dart';
import 'package:citvs/app/ui/pages/widgets/date_picker.dart';
import 'package:citvs/app/controllers/vehicles_controller.dart';
import 'package:citvs/app/ui/pages/widgets/text_select.dart';
import 'package:get/get.dart';

class VehiclesPage extends GetView<VehiclesController> {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vehiclesCL = Get.put(VehiclesController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 249, 252, 255),
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
                      textLabel: "SEDE",
                      iconData: Icons.domain,
                    ),
                    Expanded(
                      child: Obx(
                        () => Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 236,
                                236), // Color de fondo del contenedor
                            borderRadius:
                                BorderRadius.circular(8), // Bordes redondeados
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
                                vehiclesCL.valueLapDropdown.value = newValue;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DatePicker(
                  label: "Fecha desde",
                  onChanged: (newDate) {
                    vehiclesCL.dateFrom.value = newDate;
                  },
                  initialDate: controller.dateFrom.value,
                ),
                DatePicker(
                  label: "Fecha hasta",
                  onChanged: (newDate) {
                    vehiclesCL.dateTo.value = newDate;
                  },
                  initialDate: controller.dateTo.value,
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
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TypeVehicle(
                      label: "Pesado",
                      icon: Icons.local_shipping,
                      quantity: vehiclesCL.heavyVehicleQuantity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TypeVehicle(
                      label: "Liviano",
                      icon: Icons.directions_car,
                      quantity: vehiclesCL.lightVehicleQuantity,
                    ),
                    const SizedBox(
                      height: 20,
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
