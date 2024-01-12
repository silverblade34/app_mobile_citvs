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
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 182, 182, 182).withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 3,
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
                  color: Color.fromARGB(255, 47, 170, 158),
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
              const Icon(
                Icons.domain,
                color: Color.fromARGB(255, 106, 157, 207),
              )
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
                      Icon(
                        Icons.description,
                        color: Color.fromARGB(255, 100, 100, 100),
                        size: 17,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Inspecciones",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 87, 87, 87),
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
                      '$numberOfInspections',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 54, 54, 54),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color.fromARGB(255, 100, 100, 100),
                        size: 17,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Facturación",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 87, 87, 87),
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
                        color: Color.fromARGB(255, 54, 54, 54),
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
