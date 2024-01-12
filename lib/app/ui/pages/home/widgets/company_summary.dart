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
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 182, 182, 182).withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 170, 158),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  '$company',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const Center(
                child: Icon(
                  Icons.domain,
                  color: Color.fromARGB(255, 106, 157, 207),
                  size: 30,
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
                  const Row(
                    children: [
                      Text(
                        "Inspecciones",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 110, 110, 110),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(
                          255, 255, 255, 255), 
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 106, 157, 207), 
                        width: 1, // Ancho del borde
                      ),
                    ),
                    child: Text(
                      '$numberOfInspections',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 110, 110, 110),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Facturación",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 110, 110, 110),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(
                          255, 255, 255, 255), // Color de fondo blanco
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 106, 157, 207), // Color de borde azul
                        width: 1, // Ancho del borde
                      ),
                    ),
                    child: Text(
                      '$billingAmount',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 110, 110, 110),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
