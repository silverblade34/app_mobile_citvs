import 'package:citvs/app/controllers/home_controller.dart';
import 'package:citvs/app/ui/pages/home/widgets/company_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCL = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(245,249,252,255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
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
