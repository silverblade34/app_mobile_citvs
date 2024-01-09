import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/navigation.layout.controller.dart';
import 'package:flutter_application_1/app/ui/pages/navigation/navigation.drawer.dart';
import 'package:get/get.dart';

/// Flutter code sample for [NavigationBar].

class NavigationLayout extends StatelessWidget {
  const NavigationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationLayoutController());

    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center, // Centra la imagen
            child: Image.asset(
              'assets/images/logo.png', // Ruta de tu logo
              height: 40, // Ajusta la altura según tu diseño
              // Opcional: ajusta la propiedad width si es necesario
              // width: 100,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/perfil.png'),
                        fit: BoxFit.cover)),
                child: Transform.translate(
                  offset: const Offset(15, -15),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white),
                        shape: BoxShape.circle,
                        color: Colors.yellow[800]),
                  ),
                ),
              ),
            )
          ],
        ),
        drawer: const NavigationDrawerLayout(),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            height: 80,
            onDestinationSelected: (int index) =>
                controller.selectedIndex.value = index,
            indicatorColor: const Color.fromARGB(255, 120, 204, 196),
            selectedIndex: controller.selectedIndex.value,
            destinations: List<Widget>.generate(
              controller.navigationDestinations.length,
              (index) => NavigationDestination(
                selectedIcon:
                    Icon(controller.navigationDestinations[index].selectedIcon),
                icon: Icon(controller.navigationDestinations[index].icon),
                label: controller.navigationDestinations[index].label,
              ),
            ),
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}
