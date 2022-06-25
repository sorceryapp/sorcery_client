import 'package:flutter/material.dart';

class TableRows {
  final Iterable rowData;
  const TableRows({required this.rowData});

  List<DataRow> make() {
    List<DataRow> rows = [];

    rowData.toList().forEach((row) {
      List<DataCell> cells = [];

      row.values.toList().forEach((value) {
        cells.add(DataCell(Text(value.toString())));
      });

      rows.add(DataRow(cells: cells));
    });

    return rows;
  }
}
