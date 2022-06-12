import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';
import 'package:url_launcher/link.dart';

class VerifyAccountForm extends ConsumerStatefulWidget {
  const VerifyAccountForm({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyAccountForm> createState() => _VerifyAccountFormState();
}

class _VerifyAccountFormState extends ConsumerState<VerifyAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _tokenTextController = TextEditingController();

  // String get _token => _tokenTextController.text;

  @override
  void dispose() {
    _tokenTextController.dispose();
    super.dispose();
  }

  _validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  _submit() async {
    // if (_formKey.currentState!.validate()) {
    //   final controller = ref.read(authControllerProvider.notifier);
    //   final success = await controller.verifyAccount(
    //     token: _token,
    //   );

    //   if (success) {
    //     if (!mounted) return;
    //     context.go('/');
    //   }
    // }
  }

  _cancel() {
    if (!mounted) return;
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      authControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Form(
      key: _formKey,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                SorceryLocalizations.current.verifyAccountPageBody,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            TextFormField(
              controller: _tokenTextController,
              validator: (value) => _validator(value),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: SorceryLocalizations.current.accountFieldVerifyToken,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(children: <Widget>[
                Expanded(
                  flex: 10,
                  child: ElevatedButton(
                    onPressed: () => _submit(),
                    child: Text(SorceryLocalizations
                        .current.accountButtonVerifyAccount),
                  ),
                ),
                const Spacer(flex: 2),
                Expanded(
                  flex: 10,
                  child: ElevatedButton(
                    onPressed: () => _cancel(),
                    child:
                        Text(SorceryLocalizations.current.accountButtonCancel),
                  ),
                )
              ]),
            ),
            Link(
              uri: Uri.parse('/requestVerifyAccountResend'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text(
                  SorceryLocalizations.current.resendVerifyAccountTextLink,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
