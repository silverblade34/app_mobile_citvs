import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/comparison.controller.dart';
import 'package:flutter_application_1/app/ui/pages/comparison/widgets/table.dynamic.dart';
import 'package:flutter_application_1/app/ui/pages/comparison/widgets/year.input.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/text.select.dart';
import 'package:get/get.dart';

class ComparisonPage extends GetView<ComparisonController> {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComparisonController());

    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return Scaffold(
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
                    ),
                    Expanded(
                      child: Obx(
                        () => Container(
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
                            value: controller.valueLapDropdown.value,
                            underline: Container(color: Colors.transparent),
                            items: controller.itemsDropDown,
                            onChanged: (String? newValue) async {
                              if (newValue != null) {
                                print("--------------2");
                                print(newValue);
                                controller.valueLapDropdown.value = newValue;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                         const TextSelect(
                      textLabel: "Tipo",
                    ),
                    Expanded(
                      child: Obx(
                        () => Container(
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
                            value: controller.valueLapDropdown.value,
                            underline: Container(color: Colors.transparent),
                            items: controller.itemsDropDown,
                            onChanged: (String? newValue) async {
                              if (newValue != null) {
                                print("--------------2");
                                print(newValue);
                                controller.valueLapDropdown.value = newValue;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 94, 172, 164),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ]),
                    child: const Text(
                      'Filtrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TableDynamic()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
