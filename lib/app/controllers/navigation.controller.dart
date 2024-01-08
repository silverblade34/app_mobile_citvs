import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/ui/pages/certificates/certificates.page.dart';
import 'package:flutter_application_1/app/ui/pages/comparison/comparison.page.dart';
import 'package:flutter_application_1/app/ui/pages/reviews/reviews.page.dart';
import 'package:flutter_application_1/app/ui/pages/tickets/tickets.page.dart';
import 'package:flutter_application_1/app/ui/pages/vehicles/vehicles.page.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    ReviewsPage(),
    TicketsPage(),
    ComparisonPage(),
    CertificatesPage(),
    VehiclesPage()
  ];
}
