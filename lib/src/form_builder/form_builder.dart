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
import 'package:url_launcher/link.dart';

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

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formWidgets = [];
    final formMap = widget.blueprint['form'];
    final formProps = getFormProps(formType: widget.blueprint['formType']);
    final controllerProvider = ControllerProviders(
        providerName: widget.blueprint['controllerProviderName']);
    final controllerAction = controllerProvider.getAction(
      ref: ref,
      controllerActionName: widget.blueprint['controllerActionName'],
    );
    controllerProvider.handleErrors(ref: ref, context: context);

    widget.blueprint['form'].keys.forEach((propName) {
      List<Widget> widgets = _makeFormWidgets(
          controllerAction: controllerAction,
          formMap: formMap,
          propName: propName);
      formWidgets = [...formWidgets, ...widgets];
    });

    return Form(
      key: _formKey,
      child: SizedBox(
        width: formProps['width'].toDouble(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: formWidgets,
        ),
      ),
    );
  }

  List<Widget> _makeFormWidgets(
      {required controllerAction,
      required Map<dynamic, dynamic> formMap,
      required String propName}) {
    String genericPropName = _makeGenericPropName(propName: propName);

    switch (genericPropName) {
      case 'formFields':
        List<Widget> widgets = [];

        for (int i = 0; i < formMap[propName].length; i += 1) {
          _makeFormWidgets(
            controllerAction: controllerAction,
            formMap: formMap[propName][i],
            propName: 'formField',
          ).forEach((widget) => widgets.add(widget));
        }

        return widgets;
      case 'formField':
        final name = formMap['name'];
        final type = formMap['type'];
        final labelText =
            Localization().getText(localizationKey: formMap['labelText']);

        _controllers[name] = _makeController(type: type);

        return [
          _makeFormField(
            name: name,
            type: type,
            controller: _controllers[name],
            labelText: labelText,
          )
        ];
      case 'formButtons':
        List<Widget> widgets = [];

        for (int i = 0; i < formMap[propName].length; i += 1) {
          _makeFormWidgets(
            controllerAction: controllerAction,
            formMap: formMap[propName][i],
            propName: 'formButton',
          ).forEach((widget) => widgets.add(widget));
        }

        return widgets;
      case 'formButton':
        return [
          _makeFormButton(
              controllerAction: controllerAction, buttonProps: formMap)
        ];
      case 'row':
        List<Widget> widgets = [];

        for (int i = 0; i < formMap[propName].length; i += 1) {
          String subPropName = formMap[propName][i].keys.first;

          _makeFormWidgets(
            controllerAction: controllerAction,
            formMap: formMap[propName][i],
            propName: subPropName,
          ).forEach((widget) => widgets.add(widget));
        }

        return [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(children: <Widget>[...widgets]),
          )
        ];
      case 'spacer':
        return [Spacer(flex: formMap[propName]['flex'])];
      case 'link':
        return [
          Link(
            uri: Uri.parse(formMap[propName]['uri']),
            builder: (context, followLink) => TextButton(
              onPressed: followLink,
              child: Text(
                Localization()
                    .getText(localizationKey: formMap[propName]['target']),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ];
      default:
        throw ('Error: unknown section name');
    }
  }

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

  Widget _makeFormButton({required controllerAction, required buttonProps}) {
    switch (buttonProps['name']) {
      case 'submit':
        final callback = ButtonCallbacks(context: context).submit(
          formKey: _formKey,
          getFormData: _getFormData,
          controllerAction: controllerAction,
          redirectPath: buttonProps['redirectPath'],
        );
        final text =
            Localization().getText(localizationKey: buttonProps['text']);

        return FormButtons().primary(
          callback: callback,
          text: text,
          flex: buttonProps['flex'],
        );
      case 'cancel':
        final callback = ButtonCallbacks(context: context).cancel(
          redirectPath: buttonProps['redirectPath'],
        );
        final text =
            Localization().getText(localizationKey: buttonProps['text']);

        return FormButtons().secondary(
          callback: callback,
          text: text,
          flex: buttonProps['flex'],
        );
      default:
        throw ('Error: error in _FormBuilderState#_makeFormButton');
    }
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

  String _makeGenericPropName({required String propName}) {
    final regex = RegExp('^[a-z]+', caseSensitive: false);
    final match = regex.firstMatch(propName);
    return match?.group(0) ?? propName;
  }
}
