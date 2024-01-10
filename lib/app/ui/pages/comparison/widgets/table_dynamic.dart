import 'package:flutter/material.dart';

class TableDynamic extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      'monthName': 'Enero',
      'firstYear': 25630,
      'intermediateYear': 25630,
      'lastYear': 35630,
    },
    {
      'monthName': 'Febrero',
      'firstYear': 25631,
      'intermediateYear': 25631,
      'lastYear': 35631,
    },
    {
      'monthName': 'Marzo',
      'firstYear': 25630,
      'intermediateYear': 25630,
      'lastYear': 35630,
    },
    {
      'monthName': 'Abril',
      'firstYear': 25631,
      'intermediateYear': 25631,
      'lastYear': 35631,
    },
    {
      'monthName': 'Mayo',
      'firstYear': 25630,
      'intermediateYear': 25630,
      'lastYear': 35630,
    },
    {
      'monthName': 'Junio',
      'firstYear': 25631,
      'intermediateYear': 25631,
      'lastYear': 35631,
    },
    {
      'monthName': 'Julio',
      'firstYear': 25630,
      'intermediateYear': 25630,
      'lastYear': 35630,
    },
    {
      'monthName': 'Agosto',
      'firstYear': 25631,
      'intermediateYear': 25631,
      'lastYear': 35631,
    },
    {
      'monthName': 'Setiem...',
      'firstYear': 25630,
      'intermediateYear': 25630,
      'lastYear': 35630,
    },
    {
      'monthName': 'Octubr..',
      'firstYear': 25631,
      'intermediateYear': 25631,
      'lastYear': 35631,
    },
    {
      'monthName': 'Noviem..',
      'firstYear': 25630,
      'intermediateYear': 25630,
      'lastYear': 35630,
    },
    {
      'monthName': 'Diciem..',
      'firstYear': 25631,
      'intermediateYear': 25631,
      'lastYear': 35631,
    },
  ];

  TableDynamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: const Color.fromARGB(77, 156, 156, 156)),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 121, 199, 192),
          ),
          children: [
            buildTableCellHeader('Mes'),
            buildTableCellHeader('2022'),
            buildTableCellHeader('2023'),
            buildTableCellHeader('2024'),
          ],
        ),
        for (final rowData in data)
          TableRow(
            children: [
              buildTableCell(rowData['monthName']),
              buildTableCell('${rowData['firstYear'] ?? ''}'),
              buildTableCell('${rowData['intermediateYear'] ?? ''}'),
              buildTableCell('${rowData['lastYear'] ?? ''}'),
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
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700
          ),
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
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 99, 99, 99),
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
