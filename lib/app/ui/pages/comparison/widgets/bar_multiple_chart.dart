import 'package:citvs/app/data/models/comparison/comparison.dart';
import 'package:citvs/app/data/models/comparison/header.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BarChartMultipleAxes extends StatelessWidget {
  RxList<Comparison> dataSource;
  Rx<Header> dataHeaders = Rx<Header>(
    Header(
      monthName: 'MES',
      firstYear: 'Default Year',
      intermediateYear: 'Default Year',
      lastYear: 'Default Year',
    ),
  );
  BarChartMultipleAxes({
    super.key,
    required this.dataHeaders,
    required this.dataSource,
  });

  @override
  Widget build(BuildContext context) {
    final RxList<ChartData> chartData = RxList<ChartData>.from(
      dataSource.map((item) {
        return ChartData(
          item.monthName,
          item.firstYear.toDouble(),
          item.intermediateYear.toDouble(),
          item.lastYear.toDouble(),
        );
      }),
    );

    return Obx(
      () => Center(
        child: SfCartesianChart(
          legend: const Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: const CategoryAxis(),
          series: <CartesianSeries>[
            BarSeries<ChartData, String>(
                name: dataHeaders.value.firstYear,
                width: 0.75,
                legendIconType: LegendIconType.diamond,
                legendItemText: dataHeaders.value.firstYear,
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y),
            BarSeries<ChartData, String>(
                name: dataHeaders.value.intermediateYear,
                width: 0.75,
                legendIconType: LegendIconType.diamond,
                legendItemText: dataHeaders.value.intermediateYear,
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y1),
            BarSeries<ChartData, String>(
                name: dataHeaders.value.lastYear,
                width: 0.75,
                legendItemText: dataHeaders.value.lastYear,
                legendIconType: LegendIconType.diamond,
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y2)
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2);
  final String x;
  final double? y;
  final double? y1;
  final double? y2;
}
