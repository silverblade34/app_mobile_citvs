import 'package:flutter/material.dart';
// -----------------------------Importaciones para los layout----------------------------------
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/custom_app_bar.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/custom_bottom_bar.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/navigation/navigation_drawer.dart';
//---------------------------------------------------------------------------------------------
import 'package:flutter_application_1/app/controllers/reviews_controller.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/date_picker.dart';
import 'package:flutter_application_1/app/ui/pages/reviews/widgets/pie_chart.dart';
import 'package:flutter_application_1/app/ui/pages/widgets/text_select.dart';
import 'package:get/get.dart';

class ReviewsPage extends GetView<ReviewsController> {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewCL = Get.put(ReviewsController());
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerLayout(),
      bottomNavigationBar: const CustomBottomNavigationBar(
        initialIndex: 0,
      ),
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
                            value: reviewCL.valueLapDropdown.value,
                            underline: Container(color: Colors.transparent),
                            items: reviewCL.itemsDropDown,
                            onChanged: (String? newValue) async {
                              if (newValue != null) {
                                reviewCL.valueLapDropdown.value = newValue;
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
                      reviewCL.dateFrom.value =
                          newDate; // Actualizar fecha desde
                    },
                  ),
                  DatePicker(
                    label: "Fecha hasta",
                    onChanged: (newDate) {
                      reviewCL.dateTo.value = newDate; // Actualizar fecha desde
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      await reviewCL.doSearch();
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
                  const PieChart()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
