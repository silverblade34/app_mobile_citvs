import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/logo.png',
          height: 45,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/perfil.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Transform.translate(
              offset: const Offset(15, -15),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.white),
                  shape: BoxShape.circle,
                  color: Colors.yellow[800],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
