import 'package:flutter/material.dart';
import 'package:citvs/app/ui/pages/widgets/button_filter.dart';
import 'package:citvs/app/controllers/tickets_controller.dart';
import 'package:citvs/app/ui/pages/tickets/widgets/cards_tickets.dart';
import 'package:citvs/app/ui/pages/widgets/date_picker.dart';
import 'package:citvs/app/ui/pages/widgets/text_select.dart';
import 'package:get/get.dart';

class TicketsPage extends GetView<TicketsController> {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TicketsController());
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
                            color: const Color.fromARGB(255, 236, 236, 236),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 45,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: controller.valueLapDropdown.value,
                            underline: Container(color: Colors.transparent),
                            items: controller.itemsDropDown,
                            onChanged: (String? newValue) async {
                              if (newValue != null) {
                                controller.valueLapDropdown.value = newValue;
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
                    controller.dateFrom.value = newDate;
                  },
                  initialDate: controller.dateFrom.value,
                ),
                DatePicker(
                  label: "Fecha hasta",
                  onChanged: (newDate) {
                    controller.dateTo.value = newDate;
                  },
                  initialDate: controller.dateTo.value,
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
                            const Color.fromARGB(255, 112, 156, 201),
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
                              color: Color.fromARGB(255, 66, 66, 66),
                            ),
                          ),
                        ),
                        Container(
                          width: 220,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 122, 177,
                                124), // Color de fondo del "botón"
                            borderRadius: BorderRadius.circular(8),
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
