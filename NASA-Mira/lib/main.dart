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
  runApp(const Mira());
}

class Mira extends StatefulWidget {
  const Mira({Key? key}) : super(key: key);

  @override
  _MiraState createState() => _MiraState();
}

class _MiraState extends State<Mira> {
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

      title: "NASA Mira",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: createMaterialColor(const Color(0xffE8672D)),
      ),
      home: const SplashScreenPage(child: HomePage(),), //Home(),
    );
  }
}