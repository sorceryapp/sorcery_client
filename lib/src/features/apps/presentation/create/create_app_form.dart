import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/features/apps/presentation/app_controller.dart';
import 'package:sorcery_desktop_v3/src/routing/router.dart';

class CreateAppForm extends ConsumerStatefulWidget {
  const CreateAppForm({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateAppForm> createState() => _CreateAppFormState();
}

class _CreateAppFormState extends ConsumerState<CreateAppForm> {
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
                  name: 'name',
                  decoration: InputDecoration(
                    labelText: SorceryLocalizations.current.appInputName,
                  ),
                  validator: FormBuilderValidators.required(),
                  keyboardType: TextInputType.number,
                ),
                FormBuilderRadioGroup(
                  name: 'framework',
                  decoration:
                      const InputDecoration(labelText: 'Choose a Framework'),
                  validator: FormBuilderValidators.required(),
                  options: [
                    'Ruby on Rails',
                    'Django',
                    'AdonisJS',
                  ]
                      .map((framework) =>
                          FormBuilderFieldOption(value: framework))
                      .toList(growable: true),
                  orientation: OptionsOrientation.vertical,
                  initialValue: null,
                ),
                FormBuilderRadioGroup(
                  name: 'type',
                  decoration: const InputDecoration(labelText: 'Choose a type'),
                  validator: FormBuilderValidators.required(),
                  options: [
                    'API',
                    'Monolith',
                  ]
                      .map((framework) =>
                          FormBuilderFieldOption(value: framework))
                      .toList(growable: true),
                  orientation: OptionsOrientation.vertical,
                ),
                FormBuilderTextField(
                  name: 'path to app',
                  decoration: InputDecoration(
                    labelText: 'path to app',
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
                              .current.appButtonCreateNewAppSubmit,
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
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _submit() async {
    if (_formKey.currentState!.validate()) {
      final formData = _formKey.currentState!.value;
      final controller = ref.watch(appControllerStateNotifierProvider.notifier);
      final app = await controller.createApp(
        formData: formData,
      );

      if (!mounted) return;

      context.goNamed(
        AppRoute.appsShow.name,
        params: {'a_id': app.appId.toString()},
      );
    }
  }

  _cancel() {
    if (!mounted) return;
    context.go('/');
  }
}
