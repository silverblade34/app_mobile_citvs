import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoughnutChart extends StatelessWidget {
  DoughnutChart(
      {required this.numberOfTickets,
      required this.numberOfInvoices,
      super.key});

  RxInt numberOfTickets;
  RxInt numberOfInvoices;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: SfCircularChart(
          legend: const Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CircularSeries<DataTicketsChart, String>>[
            DoughnutSeries<DataTicketsChart, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: <DataTicketsChart>[
                DataTicketsChart('Boletas', numberOfTickets.value),
                DataTicketsChart('Facturas', numberOfInvoices.value),
              ],
              xValueMapper: (DataTicketsChart ticket, _) => ticket.name,
              yValueMapper: (DataTicketsChart ticket, _) => ticket.value,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}

class DataTicketsChart {
  DataTicketsChart(this.name, this.value);
  final String name;
  final int value;
}
