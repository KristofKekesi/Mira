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
      applicationLegalese: 'Kristóf Kékesi',
      applicationIcon: Image.asset(
        'lib/images/mira_logo.png',
        height: 20,
        width: 20,
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

      title: "NASA Mira",
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .1,
              right: MediaQuery.of(context).size.width * .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * .05, left: (MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2 * .04),
                    child: Container(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppLocalizations.of(context).translate('title'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular((MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2 * .04),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .1),
                          child: Image.asset(
                            'lib/images/home_mira_logo.png',
                            width: MediaQuery.of(context).size.width * .5,
                            height: MediaQuery.of(context).size.width * .5,
                          ),
                        ),
                       Tooltip(
                              message: AppLocalizations.of(context)
                                  .translate('creditsTooltip'),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                onPressed: () {
                                  autoAboutDialog(context);
                                },
                                color: Colors.white,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .4, child: Center(child: Text(
                                  AppLocalizations.of(context)
                                      .translate('credits'),
                                  style: TextStyle(
                                    letterSpacing: 7,
                                    fontSize: MediaQuery.of(context).size.width * .05,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                ),
                            ),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .02,
                              bottom: MediaQuery.of(context).size.height * .02,
                          ),
                          child: Text(
                            AppLocalizations.of(context).translate('key'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * .045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .05,
                    bottom: MediaQuery.of(context).size.width * .1),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2 * .04))),
                  width: MediaQuery.of(context).size.width * .8,
                  child: GestureDetector(
                    onTap: () {
                      final action = CupertinoActionSheet(
                        title: Text(
                          AppLocalizations.of(context)
                              .translate('vehicleMenuTitle'),
                          style: TextStyle(fontSize: 27),
                        ),
                        message: Text(
                          AppLocalizations.of(context)
                              .translate('vehicleMenuSub'),
                          style: TextStyle(fontSize: 15.0, letterSpacing: 5),
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
                                  builder: (context) => setOpportunity(),
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
                          child: Text(AppLocalizations.of(context)
                              .translate('vehicleMenuClose')),
                          isDestructiveAction: true,
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                      showCupertinoModalPopup(
                          context: context, builder: (context) => action);
                    },
                    child: Tooltip(
                      message: AppLocalizations.of(context)
                          .translate('selectVehicles'),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .02,
                          bottom: MediaQuery.of(context).size.height * .02,
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context).translate('menu'),
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
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
