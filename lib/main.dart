import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:mira/localization.dart';

import 'package:mira/pages/spirit.dart';
import 'package:mira/pages/curiosity.dart';
import 'package:mira/pages/opportunity.dart';

import 'package:splashscreen/splashscreen.dart';

var routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => Home(),
};

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }
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

void autoAboutDialog(context) {
  showAboutDialog(
      context: context,
      applicationVersion: '0.0.1',
      applicationName: 'NASA Mira',
      applicationLegalese: 'Kristof Kekesi',
      applicationIcon: Image.asset(
        'lib/images/home_mira_logo.png',
        height: 40,
        width: 40,
      ));
}

void main() => runApp(Mira());

class Mira extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('hu', ''),
        const Locale('en', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      title: 'NASA Mira',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
      ),
      home: Splash(), //Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment(-0.6, 0),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0, top: 20, left: 20),
                  child: Text(
                    AppLocalizations.of(context).translate('title'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: const Radius.circular(25),
                        bottomRight: const Radius.circular(25),
                      )),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Image.asset(
                          'lib/images/home_mira_logo.png',
                          width: 170,
                          height: 170,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.9),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onPressed: () {
                              final action = CupertinoActionSheet(
                                title: Text(
                                  AppLocalizations.of(context).translate('vehicleMenuTitle'),
                                  style: TextStyle(fontSize: 27),
                                ),
                                message: Text(
                                  AppLocalizations.of(context).translate('vehicleMenuSub'),
                                  style: TextStyle(
                                      fontSize: 15.0, letterSpacing: 5),
                                ),
                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    child: Text('MER-A Spirit'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => setSpirit(),
                                        ),
                                      );
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text('MER-B Opportunity'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              setOpportunity(),
                                        ),
                                      );
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text('Curiosity'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => setCuriosity(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  child: Text(AppLocalizations.of(context).translate('vehicleMenuClose')),
                                  isDestructiveAction: true,
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => action);
                            },
                            color: Colors.white,
                            child: Text(
                              AppLocalizations.of(context).translate('menu'),
                              style: TextStyle(
                                letterSpacing: 20.0,
                                fontSize: 15,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.9),
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onPressed: () {
                              autoAboutDialog(context);
                            },
                            color: Colors.white,
                            child: Text(
                              AppLocalizations.of(context).translate('credits'),
                              style: TextStyle(
                                letterSpacing: 8.5,
                                fontSize: 15,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          AppLocalizations.of(context).translate('key'),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}