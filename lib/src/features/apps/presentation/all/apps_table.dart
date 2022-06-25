import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/app_rows.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/app_columns.dart';

class AppTable {
  final List objectList;
  const AppTable({required this.objectList});

  makeTableWidget() {
    return DataTable(
      columns: TableColumns(
              columnNames: objectList.toList().first.toMap().keys.toList())
          .make(),
      rows:
          TableRows(rowData: objectList.map((object) => object.toMap())).make(),
    );
  }
}
