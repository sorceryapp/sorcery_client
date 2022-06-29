import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/approved_columns.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/mapped_column_headers.dart';

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
              mappedColumnHeaders[columnName] ??
                  'Error: translation is missing',
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        );
      }
    }

    return columns;
  }
}
