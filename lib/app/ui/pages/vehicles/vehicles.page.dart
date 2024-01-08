import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/vehicles.controller.dart';
import 'package:get/get.dart';

class VehiclesPage extends GetView<VehiclesController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('VehiclesPage')),

    body: SafeArea(
      child: Text('VehiclesController'))
    );
  }
}