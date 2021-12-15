import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ms_material_color/ms_material_color.dart';

import 'utils/orientationLock.dart';
import 'utils/noMaterialGlow.dart';
//import 'utils/darkTitlebar.dart';
import 'utils/localization.dart';

// todo implement
//import 'widgets/splashScreen/index.dart';
//import 'widgets/drawer/index.dart';

//import 'widgets/roverGrid.dart';
//import 'widgets/selector.dart';
//import 'widgets/appbars.dart';
//import 'widgets/apod.dart';


class MiraApp extends StatefulWidget {
  const MiraApp(
      {Key? key, required this.name,
        required this.data, required this.background, required this.color, required this.version})
      : super(key: key);

  final String name;
  final dynamic data; // todo get type
  final String background;
  final int color;
  final String version;

  @override
  State<MiraApp> createState() => _MiraAppState();
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
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: child ?? Container(),
        );
      },
      // todo implement
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
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale?.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      title: widget.name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MsMaterialColor(widget.color),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Text("name: " +
            widget.name + ", data: " +
            widget.data.toString() +
            ", background: " +
            widget.background +
            ", color: " +
            widget.color.toString() +
            ", version. " +
            widget.version),
      ),
    );
  }
}