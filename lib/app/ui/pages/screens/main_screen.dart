import 'package:citvs/app/controllers/mainscreen_controller.dart';
import 'package:citvs/app/ui/pages/screens/widgets/custom_app_bar.dart';
import 'package:citvs/app/ui/pages/screens/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final mainScreenCL = Get.put(MainScreenController());
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawerLayout(),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 0.3, color: Color.fromARGB(255, 97, 97, 97))),
          ),
          child: NavigationBar(
            height: 80,
            backgroundColor: Colors.white,
            elevation: 0,
            indicatorColor: const Color.fromARGB(255, 120, 204, 196),
            onDestinationSelected: (int index) {
              mainScreenCL.selectedIndex.value = index;
            },
            selectedIndex: mainScreenCL.selectedIndex.value,
            destinations: List<Widget>.generate(
              5,
              (index) => NavigationDestination(
                selectedIcon: Icon(
                    mainScreenCL.navigationDestinations[index].selectedIcon),
                icon: Icon(mainScreenCL.navigationDestinations[index].icon),
                label: mainScreenCL.navigationDestinations[index].label,
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
      body: Obx(() => mainScreenCL.screens[mainScreenCL.selectedIndex.value]()),
    );
  }
}
