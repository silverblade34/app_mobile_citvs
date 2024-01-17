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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 110, 110, 110),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: backgroundColor,
                  width: 1,
                ),
              ),
              child: Obx(
                () => Text(
                  '${value.value}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 110, 110, 110),
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
