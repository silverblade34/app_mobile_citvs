import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTicket extends StatelessWidget {
  final String title;
  final RxInt value;
  final Color backgroundColor;

  const CardTicket({
    super.key,
    required this.title,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Padding para las Column
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins', // Establece la fuente Poppins
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(
                () => Text(
                  '${value.value}', // Coloca el valor dinámico aquí
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
