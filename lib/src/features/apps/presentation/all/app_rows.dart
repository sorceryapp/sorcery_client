import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/attributes.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/approved_columns.dart';
import 'package:url_launcher/link.dart';

class TableRows {
  final Iterable rowData;
  const TableRows({required this.rowData});

  List<DataRow> make() {
    List<DataRow> rows = [];

    rowData.toList().forEach((row) {
      List<DataCell> cells = [];

      row.forEach((columnName, value) {
        if (approvedColumns.contains(columnName)) {
          Widget cellWidget;

          switch (columnName) {
            case 'name':
              cellWidget = Link(
                uri: Uri.parse('/apps/${row['appId']}'),
                builder: (context, followLink) => TextButton(
                  onPressed: followLink,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              );
              break;
            case 'languageId':
              cellWidget = Text(languages[value]!);
              break;
            case 'frameworkId':
              cellWidget = Text(frameworks[value]!);
              break;
            case 'typeId':
              cellWidget = Text(types[value]!);
              break;
            default:
              cellWidget = Text(value.toString());
          }

          cells.add(DataCell(cellWidget));
        }
      });

      rows.add(DataRow(cells: cells));
    });

    return rows;
  }
}
