import 'package:citvs/app/controllers/home_controller.dart';
import 'package:citvs/app/ui/pages/home/widgets/company_summary.dart';
// -----------------------------Importaciones para los layout----------------------------------
import 'package:citvs/app/ui/pages/widgets/navigation/custom_app_bar.dart';
import 'package:citvs/app/ui/pages/widgets/navigation/custom_bottom_bar.dart';
import 'package:citvs/app/ui/pages/widgets/navigation/navigation_drawer.dart';
//---------------------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCL = Get.put(HomeController());

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
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeCL.companies.length,
                  itemBuilder: (context, index) {
                    return CompanySummary(
                      billingAmount: homeCL.companies[index].billingAmount,
                      numberOfInspections:
                          homeCL.companies[index].numberOfInspections,
                      company: homeCL.companies[index].company,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
