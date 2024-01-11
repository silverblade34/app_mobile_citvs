import 'package:flutter/material.dart';
import 'package:citvs/app/routes/pages.dart';
import 'package:get/get.dart';

class NavigationLayoutController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  List<Destination> navigationDestinations = [
    Destination(
      selectedIcon: Icons.dashboard_customize,
      icon: Icons.dashboard_customize_outlined,
      label: 'Revisiones',
      route: Routes.REVIEWS,
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
      label: 'Comparación',
      route: Routes.COMPARISON,
    ),
    Destination(
      selectedIcon: Icons.receipt_long,
      icon: Icons.receipt_long_outlined,
      label: 'Certificados',
      route: Routes.REVIEWS,
    ),
    Destination(
      selectedIcon: Icons.directions_car_filled,
      icon: Icons.directions_car_filled_outlined,
      label: 'Vehiculos',
      route: Routes.VEHICLES,
    ),
  ];
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
