import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/routing/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate, //
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate, // Not using Cupertino
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'Sorcery',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.black, // background (button) color
            onPrimary: Colors.white, // foreground (text) color
          ),
        ),
      ),
    );
  }
}
