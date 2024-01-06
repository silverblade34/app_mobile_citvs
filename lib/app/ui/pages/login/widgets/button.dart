import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget {
  final Function()? onTap;
  const ButtonGlobal({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
            color: GlobalColors.mainColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              ),
            ]),
        child: const Text(
          'Ingresar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
