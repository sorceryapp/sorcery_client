import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class TableRows {
  final Iterable rowData;
  const TableRows({required this.rowData});

  List<DataRow> make() {
    List<DataRow> rows = [];

    rowData.toList().forEach((row) {
      List<DataCell> cells = [];

      row.forEach((key, value) {
        if (key == 'name') {
          cells.add(
            DataCell(
              Link(
                uri: Uri.parse('/apps/${row['appId']}'),
                builder: (context, followLink) => TextButton(
                  onPressed: followLink,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
          );
        } else {
          cells.add(DataCell(Text(value.toString())));
        }
      });

      rows.add(DataRow(cells: cells));
    });

    return rows;
  }
}
