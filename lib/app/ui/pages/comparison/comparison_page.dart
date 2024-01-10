import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/button_filter.dart';
// -----------------------------Importaciones para los layout----------------------------------
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/custom_app_bar.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/custom_bottom_bar.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/navigation_drawer.dart';
//---------------------------------------------------------------------------------------------
import 'package:flutter_application_1/app/controllers/comparison_controller.dart';
import 'package:flutter_application_1/app/ui/pages/comparison/widgets/table_dynamic.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/text_select.dart';
import 'package:get/get.dart';

class ComparisonPage extends GetView<ComparisonController> {
  const ComparisonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComparisonController());

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerLayout(),
      bottomNavigationBar: const CustomBottomNavigationBar(
        initialIndex: 2,
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
                ButtonFilter(onTap: () async {
                  await controller.doSearch();
                }),
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
