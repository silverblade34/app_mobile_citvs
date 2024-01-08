import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/controllers/certificates.controller.dart';
import 'package:get/get.dart';

class CertificatesPage extends GetView<CertificatesController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('CertificatesPage')),

    body: SafeArea(
      child: Text('CertificatesController'))
    );
  }
}