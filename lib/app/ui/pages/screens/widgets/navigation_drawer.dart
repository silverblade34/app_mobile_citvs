import 'package:citvs/app/controllers/mainscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigationDrawerLayout extends StatelessWidget {
  const NavigationDrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final mainScreenCL = Get.find<MainScreenController>(); // Usa Get.find

    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context, mainScreenCL),
            buildMenuItems(context, mainScreenCL)
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, MainScreenController controller) =>
      Material(
        color: const Color.fromARGB(255, 20, 180, 164),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape
                        .circle, // Utiliza shape: BoxShape.circle para el contenedor
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/perfil.png',
                      width:
                          100, // Puedes ajustar el ancho de la imagen según sea necesario
                      height:
                          100, // Puedes ajustar la altura de la imagen según sea necesario
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => Text(
                      "${controller.username}",
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(
          BuildContext context, MainScreenController controller) =>
      Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ...controller.navigationDestinations.asMap().entries.map((entry) {
            final index = entry.key;
            final destination = entry.value;

            return ListTile(
              leading: Icon(destination.selectedIcon),
              title: Text(destination.label),
              onTap: () {
                controller.selectedIndex.value = index;
                Navigator.pop(context);
              },
            );
          }).toList(),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () async {
              EasyLoading.show(status: 'Cerrando sesión...');
              GetStorage().erase();
              await Future.delayed(
                const Duration(seconds: 1),
              );
              Get.offAllNamed('/login');

              EasyLoading.dismiss();
            },
          ),
        ],
      );
}
