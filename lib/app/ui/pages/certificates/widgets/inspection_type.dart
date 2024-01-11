import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InspectionType extends StatelessWidget {
  const InspectionType({
    super.key,
    required this.label,
    required this.icon,
    required this.quantity,
  });
  final String label;
  final IconData icon;
  final RxInt quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 45,
            color: const Color.fromARGB(255, 126, 126, 126),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 110, 110, 110),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 90,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color.fromARGB(255, 106, 157, 207),
            ),
            child: Text(
              '${quantity.value}',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
