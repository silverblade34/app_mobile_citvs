import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/reviews.controller.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/date.picker.dart';
import 'package:flutter_application_1/app/ui/pages/reviews/widgets/pie.chart.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/text.select.dart';
import 'package:get/get.dart';

class ReviewsPage extends GetView<ReviewsController> {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25.0),
            child: Obx(
              () => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                   const TextSelect(
                      textLabel: "Sede",
                    ),
                      Expanded(
                        child: Container(
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
                                controller.valueLapDropdown.value = newValue;
                              }
                            },
                          ),
                        ),
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
                      controller.dateTo.value =
                          newDate; // Actualizar fecha desde
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      await controller.doSearch();
                    },
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
                  PieChart()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
