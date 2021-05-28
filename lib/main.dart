import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasamira/widgets/apod.dart';
import 'package:nasamira/widgets/appbars.dart';
import 'package:nasamira/widgets/localization.dart';
import 'package:nasamira/widgets/roverGrid.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/drawer.dart';
import 'widgets/selector.dart';

double getGrid(context) {
  return MediaQuery.of(context).size.width * .4 -
      MediaQuery.of(context).size.width * .0125;
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      title: Text(
        'NASA Mira',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      loadingText: Text(
        AppLocalizations.of(context).translate('loading'),
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      imageBackground: AssetImage('lib/images/background.jpg'),
      image: Image(
        image: AssetImage('lib/images/home_mira_logo.png'),
      ),
      photoSize: 50,
      loaderColor: Colors.white,
      navigateAfterSeconds: Home(),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

void main() => runApp(Mira());

class Mira extends StatefulWidget {
  @override
  _MiraState createState() => _MiraState();
}

class _MiraState extends State<Mira> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
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
      home: Splash(), //Home(),
    );
  }
}

bool selectorHelicopters = true;
bool selectorRovers = true;
bool selectorOrbiters = true;
bool selectorLanders = true;
bool selectorFlybys = true;

bool sortIsReverse = false;

ValueNotifier<bool> selectorFinalHelicopters =
    ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalRovers =
    ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalOrbiters =
    ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalLanders =
    ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalFlybys =
    ValueNotifier<bool>(selectorHelicopters);

ValueNotifier<bool> sortFinalIsReverse = ValueNotifier<bool>(sortIsReverse);

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .05,
                right: MediaQuery.of(context).size.width * .05),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Opacity(
                        opacity: 0,
                        child: Appbar(
                          title:
                              AppLocalizations.of(context).translate("title"),
                          leftAction: Container(),
                          rightAction: Tooltip(
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
                      Container(
                        height: MediaQuery.of(context).size.width * .03,
                      ),
                      ApodWidget(),
                      RoverGrid(sortFinalIsReverse, selectorFinalHelicopters,
                          "helicopter"),
                      RoverGrid(
                          sortFinalIsReverse, selectorFinalRovers, "rover"),
                      RoverGrid(
                          sortFinalIsReverse, selectorFinalOrbiters, "orbiter"),
                      RoverGrid(
                          sortFinalIsReverse, selectorFinalLanders, "lander"),
                      RoverGrid(
                          sortFinalIsReverse, selectorFinalFlybys, "flyby"),
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * .05,
                          ),
                          child: Container()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .05,
                right: MediaQuery.of(context).size.width * .05),
            child: Appbar(
              title: AppLocalizations.of(context).translate("title"),
              leftAction: Container(),
              rightAction: Tooltip(
                message: AppLocalizations.of(context).translate("settings"),
                child: GestureDetector(
                  onTap: () {
                    showSelectors(context);
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
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
      drawer: customDrawer(),
    );
  }
}
