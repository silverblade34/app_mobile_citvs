import 'package:flutter/material.dart';
// -----------------------------Importaciones para los layout----------------------------------
import 'package:citvs/app/ui/pages/widgets/navigation/custom_app_bar.dart';
import 'package:citvs/app/ui/pages/widgets/navigation/custom_bottom_bar.dart';
import 'package:citvs/app/ui/pages/widgets/navigation/navigation_drawer.dart';
//---------------------------------------------------------------------------------------------
import 'package:citvs/app/controllers/certificates_controller.dart';
import 'package:citvs/app/ui/pages/widgets/button_filter.dart';
import 'package:citvs/app/ui/pages/widgets/date_picker.dart';
import 'package:citvs/app/ui/pages/reviews/widgets/pie_chart.dart';
import 'package:citvs/app/ui/pages/widgets/text_select.dart';
import 'package:get/get.dart';

class CertificatesPage extends GetView<CertificatesController> {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final certificatesCL = Get.put(CertificatesController());
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerLayout(),
      bottomNavigationBar: const CustomBottomNavigationBar(
        initialIndex: 3,
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
                        iconData: Icons.domain,
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
                            value: certificatesCL.valueLapDropdown.value,
                            underline: Container(color: Colors.transparent),
                            items: certificatesCL.itemsDropDown,
                            onChanged: (String? newValue) async {
                              if (newValue != null) {
                                certificatesCL.valueLapDropdown.value =
                                    newValue;
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
                      certificatesCL.dateFrom.value =
                          newDate; // Actualizar fecha desde
                    },
                  ),
                  DatePicker(
                    label: "Fecha hasta",
                    onChanged: (newDate) {
                      certificatesCL.dateTo.value =
                          newDate; // Actualizar fecha desde
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonFilter(onTap: () async {
                    await certificatesCL.doSearch();
                  }),
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