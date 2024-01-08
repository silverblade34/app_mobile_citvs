import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieChart extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
        child: SfCircularChart(
            legend: Legend(isVisible: true),
            series: <CircularSeries<SalesData, String>>[
          DoughnutSeries<SalesData, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: <SalesData>[
                SalesData('Aprobados', 35),
                SalesData('Desaprobados', 28),
                SalesData('Anulados', 34),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
