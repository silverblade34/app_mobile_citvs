import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/pages/login/login_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginPage());
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 255, 253),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 200,
            height: 200,
          ),
        ],
      )),
    );
  }
}
