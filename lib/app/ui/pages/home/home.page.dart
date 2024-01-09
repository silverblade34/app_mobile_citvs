import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/home.controller.dart';
import 'package:flutter_application_1/app/ui/pages/navigation/navigation.layout.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.teal,
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.teal,
              ),
              height: height * 0.20,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
