import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/data/auth_repository.dart';

class VerifyAccountScreen extends ConsumerStatefulWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyAccountScreen> createState() => _VerifyAccountScreen();
}

class _VerifyAccountScreen extends ConsumerState<VerifyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateChangesProvider).value;
    final firstName =
        '${user?.firstName[0].toUpperCase()}${user?.firstName.substring(1).toLowerCase()}';
    const SizedBox box = SizedBox(height: 40);

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            Text(
              '$firstName, ${SorceryLocalizations.current.verifyAccountPageTitle}',
              style: const TextStyle(fontSize: 20),
            ),
            box,
          ],
        ),
      ),
    );
  }
}
