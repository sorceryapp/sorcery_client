import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/approved_columns.dart';

class TableColumns {
  final Iterable columnNames;
  const TableColumns({required this.columnNames});

  List<DataColumn> make() {
    List<DataColumn> columns = [];

    for (final columnName in columnNames) {
      if (approvedColumns.contains(columnName)) {
        columns.add(
          DataColumn(
            label: Text(
              columnName,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        );
      }
    }

    return columns;
  }
}
