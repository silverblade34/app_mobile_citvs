import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCircularChart(
            legend: const Legend(isVisible: true),
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
              dataLabelSettings: const DataLabelSettings(isVisible: true)),
        ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
