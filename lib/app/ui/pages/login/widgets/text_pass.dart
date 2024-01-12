import 'package:flutter/material.dart';
import 'package:get/get.dart';

Obx TextFieldPass(
    {required TextEditingController controller, required RxBool obs}) {
  return Obx(
    () => TextField(
      controller: controller,
      obscureText: obs.value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        label: const Text('Contraseña'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            obs.value = !obs.value;
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
      ),
    ),
  );
}
