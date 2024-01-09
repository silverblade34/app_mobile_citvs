import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/tickets.controller.dart';
import 'package:flutter_application_1/app/ui/pages/tickets/widgets/cards.tickets.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/date.picker.dart';
import 'package:get/get.dart';

class TicketsPage extends GetView<TicketsController> {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TicketsController());
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
                    const Expanded(
                      child: Text(
                        "Sedes",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
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
                            height: 40,
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
                const DatePicker(
                  label: "Fecha desde",
                ),
                const DatePicker(
                  label: "Fecha hasta",
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
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
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Justifica entre los elementos
                  children: [
                    CardTicket(
                      title: 'Boletas\nEmitidas',
                      value: controller.ballotsIssued,
                      backgroundColor: const Color.fromARGB(255, 105, 179, 240),
                    ),
                    CardTicket(
                      title: 'Facturas\nEmitidas',
                      value: controller.issuedInvoices,
                      backgroundColor: const Color.fromARGB(255, 233, 219, 91),
                    ),
                    CardTicket(
                      title: 'Anulaciones\nEmitidas',
                      value: controller.cancellationsIssued,
                      backgroundColor: const Color.fromARGB(255, 231, 108, 99),
                    ),
                  ],
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
                            color: const Color.fromARGB(255, 113, 189,
                                116), // Color de fondo del "botón"
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
