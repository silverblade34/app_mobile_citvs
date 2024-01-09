import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/navigation.layout.controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavigationDrawerLayout extends StatelessWidget {
  const NavigationDrawerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<
        NavigationLayoutController>(); // Obtén la instancia del controlador

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context, controller)
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.teal[300],
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
                  width: 150, // Ancho deseado del contenedor
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Borde redondeado
                    color: Colors.white, // Fondo blanco
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10), // Borde redondeado para la imagen
                    child: Image.asset(
                      'assets/logos/logo_company.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(
          BuildContext context, NavigationLayoutController controller) =>
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
                controller.selectedIndex.value =
                    index; // Actualiza el índice al hacer tap
                Navigator.of(context).pop();
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
            onTap: () {
              GetStorage()
                  .erase(); // Esto borra todos los datos guardados en el almacenamiento local

              // Navegar a la ruta de inicio de sesión (login)
              Get.offNamed('/login');
            },
          ),
        ],
      );
}
