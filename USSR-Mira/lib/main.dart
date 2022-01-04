// todo add tests

// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// utils
import 'utils/orientation_lock.dart';
import 'utils/no_material_glow.dart';
import 'utils/material_color.dart';
import 'utils/dark_titlebar.dart';
import 'utils/localization.dart';

// pages
import 'pages/splash_screen.dart';
import 'pages/home_page.dart';

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

class MiraApp extends StatefulWidget {
  const MiraApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _MiraAppState createState() => _MiraAppState();
}

class _MiraAppState extends State<MiraApp> {
  @override
  void initState() {
    super.initState();
    orientationLock();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, Widget? child) {
        return ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: child!,
        );
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('de', ''),
        Locale('da', ''),
        Locale('hu', ''),
      ],
      localeResolutionCallback: (Locale? locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale!.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      title: "USSR Mira",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: createMaterialColor(const Color(0xffd02717)),
      ),
      home: widget.child,
    );
  }
}
