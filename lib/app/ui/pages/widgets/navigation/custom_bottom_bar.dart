import 'package:flutter/material.dart';
import 'package:citvs/app/controllers/navigation_layout_controller.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int initialIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationCL = Get.find<NavigationLayoutController>(); // Usa Get.find

    return NavigationBar(
      height: 80,
      indicatorColor: const Color.fromARGB(255, 120, 204, 196),
      onDestinationSelected: (int index) {
        navigationCL.selectedIndex.value = index;
        final selectedDestination = navigationCL.navigationDestinations[index];
        Get.offAllNamed(selectedDestination.route);
      },
      selectedIndex: initialIndex,
      destinations: List<Widget>.generate(
        5,
        (index) => NavigationDestination(
          selectedIcon:
              Icon(navigationCL.navigationDestinations[index].selectedIcon),
          icon: Icon(navigationCL.navigationDestinations[index].icon),
          label: navigationCL.navigationDestinations[index].label,
        ),
      ),
    );
  }
}
