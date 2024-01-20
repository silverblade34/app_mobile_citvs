import 'package:citvs/app/data/models/comparison/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// ignore: must_be_immutable
class TableGrid extends StatelessWidget {
  RxString beforeValue;
  List<dynamic> dataSource;
  Rx<Header> dataHeaders = Rx<Header>(
    Header(
      monthName: 'MES',
      firstYear: 'Default Year',
      intermediateYear: 'Default Year',
      lastYear: 'Default Year',
    ),
  );

  TableGrid({
    Key? key,
    required this.dataSource,
    required this.dataHeaders,
    required this.beforeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: const Color.fromARGB(255, 112, 156, 201),
        ),
        child: SfDataGrid(
          rowHeight: 35,
          headerRowHeight: 35,
          columnWidthMode: ColumnWidthMode.auto,
          selectionMode: SelectionMode.none,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          allowColumnsResizing: true,
          source: ComparisonDataSource(dataSource, beforeValue.value),
          columns: buildDynamicGridColumns(dataHeaders.value),
        ),
      ),
    );
  }

  List<GridColumn> buildDynamicGridColumns(columnNames) => <GridColumn>[
        GridColumn(
          columnName: 'monthName',
          label: Container(
            alignment: Alignment.center,
            child: Text(
              columnNames.monthName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        GridColumn(
          columnName: 'firstYear',
          label: Container(
            alignment: Alignment.center,
            child: Text(
              columnNames.firstYear,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        GridColumn(
          columnName: 'intermediateYear',
          label: Container(
            alignment: Alignment.center,
            child: Text(
              columnNames.intermediateYear,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        GridColumn(
          columnName: 'lastYear',
          label: Container(
            alignment: Alignment.center,
            child: Text(
              columnNames.lastYear,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ];
}

class ComparisonDataSource extends DataGridSource {
  final List<dynamic> data;
  final String beforeValue;
  ComparisonDataSource(this.data, this.beforeValue);

  @override
  List<DataGridRow> get rows => data
      .map<DataGridRow>((e) => DataGridRow(cells: [
            DataGridCell<String>(
              columnName: 'monthName',
              value: e.monthName,
            ),
            DataGridCell<String>(
              columnName: 'firstYear',
              value: '$beforeValue ${e.firstYear}',
            ),
            DataGridCell<String>(
              columnName: 'intermediateYear',
              value: '$beforeValue ${e.intermediateYear}',
            ),
            DataGridCell<String>(
              columnName: 'lastYear',
              value: '$beforeValue ${e.lastYear}',
            ),
          ]))
      .toList();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: e.columnName == 'monthName'
              ? Alignment.center
              : Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
