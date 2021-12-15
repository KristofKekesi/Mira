// @dart=2.9

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/orientationLock.dart';
import 'utils/noMaterialGlow.dart';
import 'utils/MaterialColor.dart';
import 'utils/darkTitlebar.dart';
import 'utils/localization.dart';

import 'pages/splashScreen.dart';
import 'pages/drawer.dart';

import 'widgets/roverGrid.dart';
import 'widgets/selector.dart';
import 'widgets/appbars.dart';
import 'widgets/apod.dart';


void main() {
  darkTitlebar();
  runApp(Mira());
}

class Mira extends StatefulWidget {
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
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: child,
        );
      },
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('de', ''),
        const Locale('da', ''),
        const Locale('hu', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      title: "NASA Mira",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: createMaterialColor(Color(0xffE8672D)),
      ),
      home: SplashScreenPage(child: HomeScreen(),), //Home(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Opacity(
                    opacity: 0,
                    child: Appbar(
                      title: AppLocalizations.of(context).translate("title"),
                      leftAction: Container(),
                      rightAction: Padding(
                        padding: EdgeInsets.only(
                            right: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                2 *
                                .04),
                        child: Tooltip(
                          message: AppLocalizations.of(context)
                              .translate("settings"),
                          child: Icon(
                            Icons.menu,
                            size: MediaQuery.of(context).size.width * .075,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * .03,
                        ),
                        ApodWidget(),
                        RoverGrid(isVisible: notifierAreHelicoptersVisible, inputType: "type",
                            filter: "helicopter", outputType: "type"),
                        RoverGrid(isVisible: notifierAreRoversVisible, inputType: "type", filter: "rover",
                            outputType: "type"),
                        RoverGrid(isVisible: notifierAreOrbitersVisible, inputType: "type", filter: "orbiter",
                            outputType: "type"),
                        RoverGrid(isVisible: notifierAreLandersVisible, inputType: "type", filter: "lander",
                            outputType: "type"),
                        RoverGrid(isVisible: notifierAreFlybysVisible, inputType: "type", filter: "flyby",
                            outputType: "type"),
                        Container(
                          height: MediaQuery.of(context).size.width * .05,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Appbar(
          title: AppLocalizations.of(context).translate("title"),
          rightAction: Padding(
            padding: EdgeInsets.only(
                right: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .04),
            child: Tooltip(
              message: AppLocalizations.of(context).translate("settings"),
              child: GestureDetector(
                onTap: () {
                  showSelectors(context, "main", false);
                },
                child: Icon(
                  Icons.menu,
                  size: MediaQuery.of(context).size.width * .075,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
      drawer: SidebarDrawer(),
    );
  }
}