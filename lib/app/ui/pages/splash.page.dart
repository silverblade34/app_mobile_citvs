import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/pages/login/login.page.dart';
import 'package:flutter_application_1/app/utils/global.colors.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginPage());
    });
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/splash_fondo.png',
            width: 200,
            height: 200,
          ),
          const Text(
            'CITV',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
