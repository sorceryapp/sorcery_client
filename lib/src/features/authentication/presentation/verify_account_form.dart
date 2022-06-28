import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:url_launcher/link.dart';

class VerifyAccountForm extends ConsumerStatefulWidget {
  const VerifyAccountForm({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyAccountForm> createState() => _VerifyAccountFormState();
}

class _VerifyAccountFormState extends ConsumerState<VerifyAccountForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'token',
                  decoration: InputDecoration(
                    labelText:
                        SorceryLocalizations.current.accountFieldVerifyToken,
                  ),
                  validator: FormBuilderValidators.required(),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          SorceryLocalizations
                              .current.accountButtonVerifyAccount,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) _submit();
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: MaterialButton(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Text(
                          SorceryLocalizations.current.accountButtonCancel,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _cancel(),
                      ),
                    ),
                  ],
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
        ),
      ],
    );
  }

  _submit() async {
    if (_formKey.currentState!.validate()) {
      final controller =
          ref.watch(authControllerStateNotifierProvider.notifier);
      final success = await controller.verifyAccount(
        formData: _formKey.currentState!.value,
      );

      if (success) {
        if (!mounted) return;
        context.go('/');
      }
    }
  }

  _cancel() {
    if (!mounted) return;
    context.go('/');
  }
}
