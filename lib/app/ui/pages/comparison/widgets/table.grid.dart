import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TableGrid extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      30,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]['title'])),
      DataCell(Text(_data[index]['price'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 30;
}


// Como crear una paginatedTable
  //  PaginatedDataTable(columns: [
  //                 DataColumn(
  //                   label: Text('ID'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Name'),
  //                 ),
  //                 DataColumn(
  //                   label: Text('Price'),
  //                 ),
  //               ], source: _data)