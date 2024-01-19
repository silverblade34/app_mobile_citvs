import 'package:citvs/app/data/models/comparison/comparison.dart';
import 'package:citvs/app/data/models/comparison/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableDynamic extends StatelessWidget {
  final List<Comparison> data;
  final Rx<Header>  dataHeader;
  const TableDynamic({required this.data, required this.dataHeader, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: const Color.fromARGB(77, 156, 156, 156)),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 112, 156, 201),
          ),
          children: [
            buildTableCellHeader(dataHeader.value.monthName),
            buildTableCellHeader(dataHeader.value.firstYear),
            buildTableCellHeader(dataHeader.value.intermediateYear),
            buildTableCellHeader(dataHeader.value.lastYear),
          ],
        ),
        for (final rowData in data)
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    rowData.monthName,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 110, 110, 110),
                    ),
                  ),
                ),
              ),
              buildTableCell('${rowData.firstYear}'),
              buildTableCell('${rowData.intermediateYear}'),
              buildTableCell('${rowData.lastYear}'),
            ],
          ),
      ],
    );
  }

  TableCell buildTableCellHeader(String text) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  TableCell buildTableCell(String text) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'S/. $text',
          textAlign: TextAlign.end,
          style: const TextStyle(
            color: Color.fromARGB(255, 110, 110, 110),
          ),
        ),
      ),
    );
  }
}
