import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/button_callback.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/form_elements.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/form_buttons.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/localization.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/validations.dart';

class FormBuilder extends ConsumerStatefulWidget {
  final Map blueprint;

  const FormBuilder({
    Key? key,
    required this.blueprint,
  }) : super(key: key);

  @override
  ConsumerState<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends ConsumerState<FormBuilder> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      authControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );

    final Map<String, dynamic> formControllers = {};
    final List<Widget> formFieldWidgets = [];

    for (final field in widget.blueprint['formFields']) {
      final controller = _makeController(type: field['type']);
      formControllers[field['name']] = controller;
      final newField = _makeField(
        name: field['name'],
        type: field['type'],
        controller: controller,
        labelText: Localization(context: context)
            .getText(localizationKey: field['labelText']),
      );
      formFieldWidgets.add(newField);
    }

    for (final buttonProps in widget.blueprint['formButtons']) {
      switch (buttonProps['name']) {
        case 'submit':
          final controllerAction = ref
              .read(authControllerProvider.notifier)
              .signInWithEmailAndPassword;
          final payload = _makePayload(controllers: formControllers);
          final callback = ButtonCallback(context: context).submit(
            redirectPath: buttonProps['redirectPath'],
            formKey: _formKey,
            controllerAction: controllerAction,
            payload: payload,
          );
          final newButton = FormButtons().primary(
            callback: callback,
            text: Localization(context: context)
                .getText(localizationKey: buttonProps['text']),
          );
          formFieldWidgets.add(newButton);
          break;
        case 'cancel':
          final callback = ButtonCallback(context: context).cancel(
            redirectPath: buttonProps['redirectPath'],
          );
          final newButton = FormButtons().secondary(
            callback: callback,
            text: Localization(context: context)
                .getText(localizationKey: buttonProps['text']),
          );
          formFieldWidgets.add(newButton);
          break;
      }
    }

    return Form(
      key: _formKey,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: formFieldWidgets,
        ),
      ),
    );
  }

  dynamic _makeController({required type}) {
    switch (type) {
      case 'textFormField':
        return TextEditingController();
      default:
        throw ('Error in _FormBuilderState#_makeController');
    }
  }

  Widget _makeField(
      {required type, required controller, required name, required labelText}) {
    switch (type) {
      case 'textFormField':
        final validator = _getValidator(name: name);
        final formElements = FormElements(
            context: context, controller: controller, validator: validator);
        return formElements.textFormField(labelText: labelText);
      default:
        return TextFormField();
    }
  }

  dynamic _getValidator({required name}) {
    switch (name) {
      case 'password':
        return Validations().password();
      case 'confirmPassword':
        return Validations().confirmPassword();
    }
  }

  Map<dynamic, dynamic> _makePayload(
      {required Map<String, dynamic> controllers}) {
    Map payload = {};

    controllers.forEach((key, value) {
      payload[key] = value.text;
    });

    return payload;
  }
}
