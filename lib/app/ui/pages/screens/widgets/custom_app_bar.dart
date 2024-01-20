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
      elevation: 0,
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            width: 35,
            height: 35,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.3, color: Color.fromARGB(255, 97, 97, 97))),
          ),
        ),
      ),
    );
  }
}
