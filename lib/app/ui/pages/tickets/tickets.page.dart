import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/tickets.controller.dart';
import 'package:get/get.dart';

class TicketsPage extends GetView<TicketsController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('TicketsPage')),

    body: SafeArea(
      child: Text('TicketsController'))
    );
  }
}