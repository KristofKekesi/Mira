import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:nasamira/widgets/apod.dart';
import 'package:nasamira/widgets/localization.dart';
import 'package:nasamira/widgets/roverGrid.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/drawer.dart';

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

ValueNotifier<bool> selectorFinalHelicopters = ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalRovers = ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalOrbiters = ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalLanders = ValueNotifier<bool>(selectorHelicopters);
ValueNotifier<bool> selectorFinalFlybys = ValueNotifier<bool>(selectorHelicopters);

ValueNotifier<bool> sortFinalIsReverse = ValueNotifier<bool>(sortIsReverse);

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void showSelectors(context) {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        // You need this, notice the parameters below:
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .025,
            ),
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * .025,
                    right: MediaQuery.of(context).size.height * .025,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .025,
                        ),
                        child: Text(
                          // TODO localize
                          "Selectors & Sort",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .05,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .025,
                        ),
                        child: Text(
                          // TODO localize
                          "Types",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05,
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        value: selectorHelicopters,
                        onChanged: (value) {
                          setState(() {
                            selectorHelicopters = value;
                          });
                        },
                        title: Text("Helicopters"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      CheckboxListTile(
                        value: selectorRovers,
                        onChanged: (value) {
                          setState(() {
                            selectorRovers = value;
                          });
                        },
                        title: Text("Rovers"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      CheckboxListTile(
                        value: selectorOrbiters,
                        onChanged: (value) {
                          setState(() {
                            selectorOrbiters = value;
                          });
                        },
                        title: Text("Orbiters"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      CheckboxListTile(
                        value: selectorLanders,
                        onChanged: (value) {
                          setState(() {
                            selectorLanders = value;
                          });
                        },
                        title: Text("Landers"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      CheckboxListTile(
                        value: selectorFlybys,
                        onChanged: (value) {
                          setState(() {
                            selectorFlybys = value;
                          });
                        },
                        title: Text("Flyby satelites"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .025,
                        ),
                        child: Text(
                          // TODO localize
                          "Sort by dates",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05,
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        value: sortIsReverse,
                        onChanged: (value) {
                          setState(() {
                              sortIsReverse = true;
                          });
                        },
                        title: Text("Ascending"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      CheckboxListTile(
                        value: !sortIsReverse,
                        onChanged: (value) {
                          setState(() {
                              sortIsReverse = false;
                          });
                        },
                        title: Text("Descending"),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actionsPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * .025,
              right: MediaQuery.of(context).size.height * .025,
            ),
            actions: [
              GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * .025,
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate("back"),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState((){
                    selectorFinalHelicopters.value = selectorHelicopters;
                    selectorFinalRovers.value = selectorRovers;
                    selectorFinalOrbiters.value = selectorOrbiters;
                    selectorFinalLanders.value = selectorLanders;
                    selectorFinalFlybys.value = selectorFlybys;

                    sortFinalIsReverse.value = sortIsReverse;

                  });
                  Navigator.pop(context);
                },
                child: Text(
                  "Search",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .05,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .05,
                      left: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04,
                      right: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04,
                    ),
                    child: Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).translate('title'),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .06,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showSelectors(context);
                              },
                              child: Icon(
                                Icons.menu,
                                size: MediaQuery.of(context).size.width * .075,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ApodWidget(),
                  RoverGrid(sortFinalIsReverse, selectorFinalHelicopters, "helicopter"),
                  RoverGrid(sortFinalIsReverse, selectorFinalRovers, "rover"),
                  RoverGrid(sortFinalIsReverse, selectorFinalOrbiters, "orbiter"),
                  RoverGrid(sortFinalIsReverse, selectorFinalLanders, "lander"),
                  RoverGrid(sortFinalIsReverse, selectorFinalFlybys, "flyby"),
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
