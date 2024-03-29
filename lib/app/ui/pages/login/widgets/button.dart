import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  final Function()? onTap;
  const ButtonGlobal({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              ),
            ]),
        child: const Text(
          'INGRESAR',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
