import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/comparison.controller.dart';
import 'package:get/get.dart';

class ComparisonPage extends GetView<ComparisonController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('ComparisonPage')),

    body: SafeArea(
      child: Text('ComparisonController'))
    );
  }
}