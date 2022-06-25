import 'package:flutter/material.dart';

class TableColumns {
  final Iterable columnNames;
  const TableColumns({required this.columnNames});

  List<DataColumn> make() {
    List<DataColumn> columns = [];

    for (final columnName in columnNames) {
      columns.add(
        DataColumn(
          label: Text(
            columnName,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      );
    }

    return columns;
  }
}
