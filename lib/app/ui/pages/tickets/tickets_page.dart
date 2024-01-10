import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/button_filter.dart';
// -----------------------------Importaciones para los layout----------------------------------
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/custom_app_bar.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/custom_bottom_bar.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/navigation_drawer.dart';
//---------------------------------------------------------------------------------------------
import 'package:flutter_application_1/app/controllers/tickets_controller.dart';
import 'package:flutter_application_1/app/ui/pages/tickets/widgets/cards_tickets.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/date_picker.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/text_select.dart';
import 'package:get/get.dart';

class TicketsPage extends GetView<TicketsController> {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TicketsController());
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerLayout(),
      bottomNavigationBar: const CustomBottomNavigationBar(
        initialIndex: 1,
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
                          )),
                    ),
                  ],
                ),
                DatePicker(
                  label: "Fecha desde",
                  onChanged: (newDate) {
                    controller.dateFrom.value =
                        newDate; // Actualizar fecha desde
                  },
                ),
                DatePicker(
                  label: "Fecha hasta",
                  onChanged: (newDate) {
                    controller.dateTo.value = newDate; // Actualizar fecha desde
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonFilter(onTap: () async {
                  await controller.doSearch();
                }),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Justifica entre los elementos
                    children: [
                      CardTicket(
                        title: 'Boletas Emitidas',
                        value: controller.ballotsIssued,
                        backgroundColor:
                            const Color.fromARGB(255, 125, 185, 224),
                      ),
                      CardTicket(
                        title: 'Facturas Emitidas',
                        value: controller.issuedInvoices,
                        backgroundColor:
                            const Color.fromARGB(255, 139, 204, 212),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Obx(
                    () => Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Ingresos totales",
                            style: TextStyle(
                              fontFamily:
                                  'Poppins', // Establece la fuente Poppins
                              color: Color.fromARGB(255, 66, 66, 66),
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 122, 177,
                                124), // Color de fondo del "botón"
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.payments,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                  width:
                                      8), // Espacio entre el ícono y el texto
                              Text(
                                'S/. ${controller.totalProffit.value}', // Coloca el valor dinámico aquí
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
