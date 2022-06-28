import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/app_rows.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/app_columns.dart';

class AppsTable {
  final List appList;
  const AppsTable({required this.appList});

  makeTableWidget() {
    return DataTable(
      columns: TableColumns(
              columnNames: appList.toList().first.toMap().keys.toList())
          .make(),
      rows: TableRows(rowData: appList.map((app) => app.toMap())).make(),
    );
  }
}
