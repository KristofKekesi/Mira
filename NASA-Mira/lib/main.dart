// Flutter
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";

// utils
import "utils/orientation_lock.dart";
import "utils/no_material_glow.dart";
import "utils/material_color.dart";
import "utils/dark_titlebar.dart";
import "utils/localization.dart";
import "pass.dart";

// pages
import "pages/splash_screen.dart";
import "pages/home_page.dart";

void main() {
  darkTitlebar();
  runApp(
    const MiraApp(
      child: SplashScreenPage(
        child: HomePage(),
      ),
    ),
  );
}

/// The MiraApp
class MiraApp extends StatefulWidget {
  /// Constructor
  const MiraApp({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// Child to pass on.
  final Widget child;

  @override
  MiraAppState createState() => MiraAppState();
}

/// Stateful section of [MiraApp].
class MiraAppState extends State<MiraApp> {
  @override
  void initState() {
    super.initState();
    orientationLock();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        builder: (BuildContext context, Widget? child) => ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: child!,
        ),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale("en", ""),
          Locale("de", ""),
          Locale("da", ""),
          Locale("hu", ""),
        ],
        localeResolutionCallback:
            (Locale? locale, Iterable<Locale> supportedLocales) {
          for (final Locale supportedLocale in supportedLocales) {
            if (locale!.languageCode == supportedLocale.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: createMaterialColor(const Color(0xffE8672D)),
        ),
        home: widget.child,
      );
}
