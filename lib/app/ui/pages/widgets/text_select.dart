import 'package:flutter/material.dart';

class TextSelect extends StatelessWidget {
  final String textLabel;
  final IconData iconData;

  const TextSelect({Key? key, required this.textLabel, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            iconData,
            size: 25,
            color: const Color.fromARGB(255, 85, 123, 161),
          ),
          const SizedBox(width: 8),
          Text(
            textLabel,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 80, 80, 80),
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
