import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/reviews.controller.dart';
import 'package:get/get.dart';

class ReviewsPage extends GetView<ReviewsController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('ReviewsPage')),

    body: SafeArea(
      child: Text('ReviewsController'))
    );
  }
}