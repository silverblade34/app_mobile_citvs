import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/pages/certificates/certificates.page.dart';
import 'package:flutter_application_1/app/ui/pages/comparison/comparison.page.dart';
import 'package:flutter_application_1/app/ui/pages/reviews/reviews.page.dart';
import 'package:flutter_application_1/app/ui/pages/tickets/tickets.page.dart';
import 'package:flutter_application_1/app/ui/pages/vehicles/vehicles.page.dart';
import 'package:get/get.dart';

class NavigationLayoutController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
   () => const ReviewsPage(), // Usa una función lambda para crear ReviewsPage
    () => const TicketsPage(),
    () => const ComparisonPage(),
    () => CertificatesPage(),
    () => VehiclesPage()
  ];

// Lista de destinos con sus respectivas propiedades
  List<Destination> navigationDestinations = [
    Destination(
      selectedIcon: Icons.dashboard_customize,
      icon: Icons.dashboard_customize_outlined,
      label: 'Revisiones',
    ),
    Destination(
      selectedIcon: Icons.paid,
      icon: Icons.paid_outlined,
      label: 'Boletas',
    ),
    Destination(
      selectedIcon: Icons.table_chart,
      icon: Icons.table_chart_outlined,
      label: 'Comparación',
    ),
    Destination(
      selectedIcon: Icons.receipt_long,
      icon: Icons.receipt_long_outlined,
      label: 'Certificados',
    ),
    Destination(
      selectedIcon: Icons.directions_car_filled,
      icon: Icons.directions_car_filled_outlined,
      label: 'Vehiculos',
    ),
  ];
}

class Destination {
  final IconData selectedIcon;
  final IconData icon;
  final String label;

  Destination({
    required this.selectedIcon,
    required this.icon,
    required this.label,
  });
}
