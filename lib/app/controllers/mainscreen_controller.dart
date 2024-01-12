import 'package:citvs/app/ui/pages/certificates/certificates_page.dart';
import 'package:citvs/app/ui/pages/comparison/comparison_page.dart';
import 'package:citvs/app/ui/pages/home/home_page.dart';
import 'package:citvs/app/ui/pages/tickets/tickets_page.dart';
import 'package:citvs/app/ui/pages/vehicles/vehicles_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  final box = GetStorage();
  final Rx<int> selectedIndex = 0.obs;
  final RxString username = RxString("");

  final screens = [
    () => const HomePage(),
    () => const TicketsPage(),
    () => const ComparisonPage(),
    () => const CertificatesPage(),
    () => const VehiclesPage()
  ];

  List<Destination> navigationDestinations = [
    Destination(
      selectedIcon: Icons.home,
      icon: Icons.home_outlined,
      label: 'Home',
    ),
    Destination(
      selectedIcon: Icons.paid,
      icon: Icons.paid_outlined,
      label: 'Boletas',
    ),
    Destination(
      selectedIcon: Icons.table_chart,
      icon: Icons.table_chart_outlined,
      label: 'Comparar',
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

  Destination({
    required this.selectedIcon,
    required this.icon,
    required this.label,
  });
}
