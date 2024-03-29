import 'package:flutter/material.dart';

class ButtonFilter extends StatelessWidget {
  final Function()? onTap;

  const ButtonFilter({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 103, 185, 177),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Filtrar',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
