import 'package:flutter/material.dart';
import 'package:citvs/app/routes/pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class NavigationLayoutController extends GetxController {
  final box = GetStorage();
  final Rx<int> selectedIndex = 0.obs;
  final RxString username = RxString("");

  List<Destination> navigationDestinations = [
    Destination(
      selectedIcon: Icons.home,
      icon: Icons.home_outlined,
      label: 'Home',
      route: Routes.HOME,
    ),
    Destination(
      selectedIcon: Icons.paid,
      icon: Icons.paid_outlined,
      label: 'Boletas',
      route: Routes.TICKETS,
    ),
    Destination(
      selectedIcon: Icons.table_chart,
      icon: Icons.table_chart_outlined,
      label: 'Comparar',
      route: Routes.COMPARISON,
    ),
    Destination(
      selectedIcon: Icons.receipt_long,
      icon: Icons.receipt_long_outlined,
      label: 'Certificados',
      route: Routes.CERTIFICATES,
    ),
    Destination(
      selectedIcon: Icons.directions_car_filled,
      icon: Icons.directions_car_filled_outlined,
      label: 'Vehiculos',
      route: Routes.VEHICLES,
    ),
  ];

  @override
  void onReady() {
    setUsername();
    super.onReady();
  }

  void setUsername() {
    username.value = box.read("username");
    // Convertir la primera letra a mayúscula
    if (username.isNotEmpty) {
      String usernameValue = username.value;
      username.value = usernameValue[0].toUpperCase() +
          usernameValue.substring(1).toLowerCase();
    }
  }
}

class Destination {
  final IconData selectedIcon;
  final IconData icon;
  final String label;
  final String route; // Agregar la propiedad route

  Destination({
    required this.selectedIcon,
    required this.icon,
    required this.label,
    required this.route,
  });
}
