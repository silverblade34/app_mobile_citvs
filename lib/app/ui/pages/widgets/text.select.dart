import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextSelect extends StatelessWidget {
final String textLabel;
  const TextSelect({super.key, required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        textLabel,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
