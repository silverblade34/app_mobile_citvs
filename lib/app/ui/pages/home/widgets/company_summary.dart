import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanySummary extends StatelessWidget {
  final RxInt numberOfInspections;
  final RxInt billingAmount;
  final RxString company;

  const CompanySummary(
      {super.key,
      required this.billingAmount,
      required this.numberOfInspections,
      required this.company});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.domain,
              color: Colors.teal,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '$company',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Inspecciones",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 106, 157, 207),
                  ),
                  child: Text(
                    '$numberOfInspections',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Facturación",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 106, 157, 207),
                  ),
                  child: Text(
                    '$billingAmount',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
