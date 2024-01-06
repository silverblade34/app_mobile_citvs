import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/navigation.controller.dart';
import 'package:get/get.dart';

/// Flutter code sample for [NavigationBar].

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            onDestinationSelected: (int index) =>
                controller.selectedIndex.value = index,
            indicatorColor: Color.fromARGB(255, 120, 204, 196),
            selectedIndex: controller.selectedIndex.value,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.dashboard_customize),
                icon: Icon(Icons.dashboard_customize_outlined),
                label: 'Revisiones',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.paid),
                icon: Icon(Icons.paid_outlined),
                label: 'Boletas',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.bar_chart),
                icon: Icon(Icons.bar_chart_outlined),
                label: 'Comparación',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.receipt_long),
                icon: Icon(Icons.receipt_long_outlined),
                label: 'Certificados',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.directions_car_filled),
                icon: Icon(Icons.directions_car_filled_outlined),
                label: 'Vehiculos',
              ),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}

