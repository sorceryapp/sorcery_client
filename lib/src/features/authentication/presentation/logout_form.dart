import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutForm extends ConsumerStatefulWidget {
  const LogoutForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LogoutForm> createState() => _LogoutFormState();
}

class _LogoutFormState extends ConsumerState<LogoutForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  _submit() async {
    final controller = ref.read(authControllerProvider.notifier);
    final success = await controller.logout();

    if (success) {
      if (!mounted) return;
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      authControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () => _submit(),
            child: Text(AppLocalizations.of(context)!.accountButtonLogout),
          ),
        ],
      ),
    );
  }
}
