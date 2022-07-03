// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m1(max) => "El valor debe ser menor o igual que ${max}.";

  static String m2(maxLength) =>
      "El valor debe tener una longitud menor o igual a ${maxLength}";

  static String m3(min) => "El valor debe ser mayor o igual que ${min}.";

  static String m4(minLength) =>
      "El valor debe tener una longitud mayor o igual a ${minLength}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountButtonCancel": MessageLookupByLibrary.simpleMessage("cancelar"),
        "accountButtonLogout":
            MessageLookupByLibrary.simpleMessage("cerrar sesión"),
        "accountButtonResetPassword":
            MessageLookupByLibrary.simpleMessage("reiniciar"),
        "accountButtonSignIn":
            MessageLookupByLibrary.simpleMessage("iniciar sesión"),
        "accountButtonSignUp":
            MessageLookupByLibrary.simpleMessage("inscribirse"),
        "accountButtonVerifyAccount":
            MessageLookupByLibrary.simpleMessage("verificar"),
        "accountButtonVerifyAccountResend":
            MessageLookupByLibrary.simpleMessage("reenviar"),
        "accountFieldConfirmPassword":
            MessageLookupByLibrary.simpleMessage("confirmar contraseña"),
        "accountFieldEmailAddress":
            MessageLookupByLibrary.simpleMessage("email"),
        "accountFieldFirstName":
            MessageLookupByLibrary.simpleMessage("primer nombre"),
        "accountFieldLastName":
            MessageLookupByLibrary.simpleMessage("apellido"),
        "accountFieldPassword":
            MessageLookupByLibrary.simpleMessage("contraseña"),
        "accountFieldVerifyToken":
            MessageLookupByLibrary.simpleMessage("token"),
        "appButtonCreateNewAppCancel":
            MessageLookupByLibrary.simpleMessage("cancelar"),
        "appButtonCreateNewAppPickPath":
            MessageLookupByLibrary.simpleMessage("elegir camino"),
        "appButtonCreateNewAppSubmit":
            MessageLookupByLibrary.simpleMessage("crear aplicación"),
        "appButtonNewApp":
            MessageLookupByLibrary.simpleMessage("nueva aplicación"),
        "appInputName": MessageLookupByLibrary.simpleMessage("nombre"),
        "appInputPathToApp":
            MessageLookupByLibrary.simpleMessage("ruta a la aplicación"),
        "appRadioFramework": MessageLookupByLibrary.simpleMessage("estructura"),
        "appRadioType": MessageLookupByLibrary.simpleMessage("tipo"),
        "appsIndexTableAppId":
            MessageLookupByLibrary.simpleMessage("ID de aplicación"),
        "appsIndexTableFrameworkId":
            MessageLookupByLibrary.simpleMessage("estructura"),
        "appsIndexTableName": MessageLookupByLibrary.simpleMessage("nombre"),
        "appsIndexTableTypeId": MessageLookupByLibrary.simpleMessage("tipo"),
        "creditCardErrorText": MessageLookupByLibrary.simpleMessage(
            "Este campo requiere un número de tarjeta de crédito válido."),
        "dateStringErrorText": MessageLookupByLibrary.simpleMessage(
            "Este campo requiere una cadena de fecha válida."),
        "emailErrorText": MessageLookupByLibrary.simpleMessage(
            "Este campo requiere una dirección de correo electrónico válida."),
        "homePageTitleAuthenticated":
            MessageLookupByLibrary.simpleMessage("hello"),
        "homePageTitleUnauthenticated":
            MessageLookupByLibrary.simpleMessage("bienvenida a"),
        "ipErrorText": MessageLookupByLibrary.simpleMessage(
            "Este campo requiere una IP válida."),
        "matchErrorText": MessageLookupByLibrary.simpleMessage(
            "El valor no coincide con el patrón requerido."),
        "maxErrorText": m1,
        "maxLengthErrorText": m2,
        "minErrorText": m3,
        "minLengthErrorText": m4,
        "numericErrorText":
            MessageLookupByLibrary.simpleMessage("El valor debe ser numérico."),
        "passwordsDoNotMatchErrorText": MessageLookupByLibrary.simpleMessage(
            "La contraseña y Confirmar contraseña deben coincidir."),
        "requiredErrorText": MessageLookupByLibrary.simpleMessage(
            "Este campo no puede estar vacío."),
        "resendVerifyAccountPageTitle": MessageLookupByLibrary.simpleMessage(
            "reenviar el correo electrónico de verificación de la cuenta"),
        "resendVerifyAccountTextLink": MessageLookupByLibrary.simpleMessage(
            "solicitar un nuevo correo electrónico de verificación"),
        "resetPasswordPageTitle":
            MessageLookupByLibrary.simpleMessage("restablecer su contraseña"),
        "signInPageTitle":
            MessageLookupByLibrary.simpleMessage("iniciar sesión"),
        "signUpPageTitle": MessageLookupByLibrary.simpleMessage("inscribirse"),
        "urlErrorText": MessageLookupByLibrary.simpleMessage(
            "Este campo requiere una dirección URL válida."),
        "verifyAccountPageBody": MessageLookupByLibrary.simpleMessage(
            "Acabamos de enviarle un correo electrónico con un token de verificación. Copie el token, luego péguelo en el campo a continuación:"),
        "verifyAccountPageTitle":
            MessageLookupByLibrary.simpleMessage("verifica tu cuenta"),
        "verifyAccountTextLink":
            MessageLookupByLibrary.simpleMessage("verifica tu cuenta")
      };
}
