import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/form_builder/button_callbacks.dart';
import 'package:sorcery_desktop_v3/src/form_builder/controller_providers.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_elements.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_buttons.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_props.dart';
import 'package:sorcery_desktop_v3/src/form_builder/localization.dart';
import 'package:sorcery_desktop_v3/src/form_builder/validators/validators.dart';

class FormBuilder extends ConsumerStatefulWidget {
  final Map<dynamic, dynamic> blueprint;

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
  List<Widget> formWidgets = [];

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formProps = getFormProps(formType: widget.blueprint['formType']);
    final controllerProvider = ControllerProviders(
        providerName: widget.blueprint['controllerProviderName']);
    final controllerAction = controllerProvider.getAction(
      ref: ref,
      controllerActionName: widget.blueprint['controllerActionName'],
    );
    controllerProvider.handleErrors(ref: ref, context: context);

    widget.blueprint['form'].keys.forEach((branch) {
      final widgets = _makeFormWidgets(branches: branch);
      formWidgets = [...formWidgets, ...widgets];

      // for (final Widget widget in widgets) {
      //   formWidgets.add(widget);
      // }
    });

    return Form(
      key: _formKey,
      child: SizedBox(
        width: formProps['width'],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: formWidgets,
        ),
      ),
    );
  }

  _makeFormWidgets({required branches}) {
    branches.keys.forEach((branch) {
      final branchName =
          branch != 'cols' && branch.startsWith('col') ? 'col' : branch;

      switch (branchName) {
        case 'formFields':
          List<Widget> widgets = [];

          widget.blueprint['form']['formFields'].forEach((formField) {
            // i don't like this hardcoded path
            Widget widget = _makeFormWidgets(branches: {
              'formField': formField,
            });

            widgets.add(widget);
          });

          return widgets;
        case 'formField':
          final name = branch['name'];
          final type = branch['type'];
          final labelText = Localization(context: context)
              .getText(localizationKey: branch['labelText']);

          _controllers[name] = _makeController(type: type);

          return _makeFormField(
            name: name,
            type: type,
            controller: _controllers[name],
            labelText: labelText,
          );
        case 'row':
          List<Widget> widgets = [];

          // LEFT OFF HERE

          widget.blueprint['form']['row'].forEach((formField) {
            // i don't like this hardcoded path
            Widget widget = _makeFormWidgets(branches: {
              'formField': formField,
            });

            widgets.add(widget);
          });

          // iterate through the row, recursively calling _makeFormWidgets
          List<Widget> widgets;
          // do this
          break;
        case 'col':
          // do this
          break;
        case 'formButtons':
          widgets = _makeFormButtons(
              formButtons: widget.blueprint['formFields'],
              controllerAction: controllerAction);

          for (final Widget widget in widgets) {
            formWidgets.add(widget);
          }
          break;
        case 'formButton':
          // this
          break;
        case 'link':
          // do this
          break;
        default:
          throw ('Error: unknown section name');
      }
    });
  }

  // List<Widget> _makeFormFields(
  //     {required List<Map<dynamic, dynamic>> formFields}) {
  //   final List<Widget> widgets = [];

  //   // Dynamically create all formField widgets
  //   for (final fieldProps in formFields) {
  //     final name = fieldProps['name'];
  //     final type = fieldProps['type'];
  //     final labelText = Localization(context: context)
  //         .getText(localizationKey: fieldProps['labelText']);

  //     _controllers[name] = _makeController(type: type);

  //     final newField = _makeFormField(
  //       name: name,
  //       type: type,
  //       controller: _controllers[name],
  //       labelText: labelText,
  //     );

  //     widgets.add(newField);
  //   }

  //   return widgets;
  // }

  Widget _makeFormField(
      {required type, required controller, required name, required labelText}) {
    switch (type) {
      case 'textFormField':
        final validator = _getValidator(name: name);
        final formElements =
            FormElements(controller: controller, validator: validator);
        return formElements.textFormField(labelText: labelText);
    }

    throw ('Error in _FormBuilderState#_makeFormField');
  }

  List<Widget> _makeFormButtons(
      {required List<Map<dynamic, dynamic>> formButtons,
      required controllerAction}) {
    final List<Widget> widgets = [];

    for (final buttonProps in formButtons) {
      switch (buttonProps['name']) {
        case 'submit':
          final callback = ButtonCallbacks(context: context).submit(
            formKey: _formKey,
            getFormData: _getFormData,
            controllerAction: controllerAction,
            redirectPath: buttonProps['redirectPath'],
          );
          final text = Localization(context: context)
              .getText(localizationKey: buttonProps['text']);

          widgets.add(FormButtons().primary(
            callback: callback,
            text: text,
          ));
          break;
        case 'cancel':
          final callback = ButtonCallbacks(context: context).cancel(
            redirectPath: buttonProps['redirectPath'],
          );
          final text = Localization(context: context)
              .getText(localizationKey: buttonProps['text']);

          widgets.add(FormButtons().secondary(
            callback: callback,
            text: text,
          ));
      }
    }

    return widgets;
  }

  Map<dynamic, dynamic> _getFormData() {
    Map formData = {};

    _controllers.forEach((fieldName, controller) {
      formData[fieldName] = controller.text;
    });

    return formData;
  }

  dynamic _makeController({required type}) {
    switch (type) {
      case 'textFormField':
        return TextEditingController();
    }

    throw ('Error in _FormBuilderState#_makeController');
  }

  dynamic _getValidator({required name}) {
    switch (name) {
      case 'firstName':
        return FormBuilderValidators.required();
      case 'lastName':
        return FormBuilderValidators.required();
      case 'email':
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ]);
      case 'password':
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.minLength(8),
        ]);
      case 'confirmPassword':
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (valueCandidate) {
            if (valueCandidate != _controllers['password']!.text) {
              return SorceryLocalizations.current.passwordsDoNotMatchErrorText;
            }

            return null;
          }
        ]);
      case 'accountVerifyToken':
        return FormBuilderValidators.required();
    }
  }
}
