import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/common_widgets/async_value_widget.dart';
import 'package:sorcery_desktop_v3/src/features/apps/data/app_repository.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/app.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/all/apps_table.dart';
import 'package:sorcery_desktop_v3/src/routing/router.dart';

class AppsScreen extends ConsumerWidget {
  const AppsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const SizedBox box = SizedBox(height: 20);
    final appData = ref.watch(appListFutureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            Row(children: <Widget>[
              const Text(
                'Apps',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () => context.goNamed(AppRoute.appsCreate.name),
                child: Text(SorceryLocalizations.current.appButtonNewApp),
              ),
            ]),
            AsyncValueWidget<List<App>>(
                value: appData,
                data: (appList) => appList.isEmpty
                    ? Center(
                        child: Text(
                          'No products found',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    : Center(
                        child: AppsTable(appList: appList).makeTableWidget(),
                      )),
          ],
        ),
      ),
    );
  }
}
