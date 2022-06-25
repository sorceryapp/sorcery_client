import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/common_widgets/async_value_widget.dart';
import 'package:sorcery_desktop_v3/src/features/apps/data/app_repository.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/app.dart';

class AppsScreen extends ConsumerWidget {
  const AppsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const SizedBox box = SizedBox(height: 20);
    final appListValue = ref.watch(appListFutureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            const Text(
              'Apps',
              style: TextStyle(fontSize: 20),
            ),
            AsyncValueWidget<List<App>>(
                value: appListValue,
                data: (apps) => apps.isEmpty
                    ? Center(
                        child: Text(
                          'No products found',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    : Center(
                        child: Text(
                          'Products found',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
