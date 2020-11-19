import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:nasamira/localization.dart';
import 'package:nasamira/pages/drawer.dart';
import 'package:nasamira/pages/perseverance.dart';
import 'package:nasamira/pages/rovers.dart';
import 'package:nasamira/pages/sojourner.dart';
import 'package:nasamira/pages/ingenuity.dart';

import 'package:nasamira/pages/spirit.dart';
import 'package:nasamira/pages/curiosity.dart';
import 'package:nasamira/pages/opportunity.dart';

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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            right: MediaQuery.of(context).size.width * .1),
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
                          .04),
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
                      Radius.circular((MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * .1),
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
                            Scaffold.of(context).openDrawer();
                          },
                          color: Colors.white,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        .01,
                                    bottom: MediaQuery.of(context).size.height *
                                        .01),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('mainCredits'),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                          AppLocalizations.of(context).translate('api'),
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
                    borderRadius: BorderRadius.all(Radius.circular(
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04))),
                width: MediaQuery.of(context).size.width * .8,
                child: GestureDetector(
                  onTap: () {
                    final action = CupertinoActionSheet(
                      title: Text(
                        AppLocalizations.of(context)
                            .translate('vehicleMenuTitle'),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .09,
                            color: Colors.black54),
                      ),
                      message: Text(
                        AppLocalizations.of(context)
                            .translate('vehicleMenuSub'),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .07,
                            color: Colors.black54),
                      ),
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          child: Text(
                            'Mars 2020 Ingenuity',
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .05,
                                color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => basicRoverSpec(
                                    appbarContentSize: .05,
                                    full_name: nameIngenuity,
                                    shrt_name: nickIngenuity,
                                    type: typeIngenuity,
                                    launch_y: launchIngenuity_y,
                                    launch_m: launchIngenuity_m,
                                    launch_d: launchIngenuity_d,
                                    arrive_y: arriveIngenuity_y,
                                    arrive_m: arriveIngenuity_m,
                                    arrive_d: arriveIngenuity_d,
                                    lc_y: lcIngenuity_y,
                                    lc_m: lcIngenuity_m,
                                    lc_d: lcIngenuity_d,
                                    end_y: endIngenuity_y,
                                    end_m: endIngenuity_m,
                                    end_d: endIngenuity_d,
                                    operator: operatorIngenuity,
                                    manufacturer: manufacturerIngenuity,
                                    isAction: false,
                                    action: null,
                                  )),
                            );
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text(
                            'Mars 2020 Perseverance',
                            style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .05,
                                color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => basicRoverSpec(
                                    appbarContentSize: .05,
                                    full_name: namePerseverance,
                                    shrt_name: nickPerseverance,
                                    type: typePerseverance,
                                    launch_y: launchPerseverance_y,
                                    launch_m: launchPerseverance_m,
                                    launch_d: launchPerseverance_d,
                                    arrive_y: arrivePerseverance_y,
                                    arrive_m: arrivePerseverance_m,
                                    arrive_d: arrivePerseverance_d,
                                    lc_y: lcPerseverance_y,
                                    lc_m: lcPerseverance_m,
                                    lc_d: lcPerseverance_d,
                                    end_y: endPerseverance_y,
                                    end_m: endPerseverance_m,
                                    end_d: endPerseverance_d,
                                    operator: operatorPerseverance,
                                    manufacturer: manufacturerPerseverance,
                                    isAction: false,
                                    action: null,
                                  )),
                            );
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text(
                            'Curiosity',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => basicRoverSpec(
                                        appbarContentSize: .07,
                                        full_name: nameCuriosity,
                                        shrt_name: nickCuriosity,
                                        type: typeCuriosity,
                                        launch_y: launchCuriosity_y,
                                        launch_m: launchCuriosity_m,
                                        launch_d: launchCuriosity_d,
                                        arrive_y: arriveCuriosity_y,
                                        arrive_m: arriveCuriosity_m,
                                        arrive_d: arriveCuriosity_d,
                                        lc_y: lcCuriosity_y,
                                        lc_m: lcCuriosity_m,
                                        lc_d: lcCuriosity_d,
                                        end_y: endCuriosity_y,
                                        end_m: endCuriosity_m,
                                        end_d: endCuriosity_d,
                                        operator: operatorCuriosity,
                                        manufacturer: manufacturerCuriosity,
                                        isAction: true,
                                        action: askCuriosity(),
                                      )),
                            );
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text(
                            'MER-B Opportunity',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => basicRoverSpec(
                                        appbarContentSize: .05,
                                        full_name: nameOpportunity,
                                        shrt_name: nickOpportunity,
                                        type: typeOpportunity,
                                        launch_y: launchOpportunity_y,
                                        launch_m: launchOpportunity_m,
                                        launch_d: launchOpportunity_d,
                                        arrive_y: arriveOpportunity_y,
                                        arrive_m: arriveOpportunity_m,
                                        arrive_d: arriveOpportunity_d,
                                        lc_y: lcOpportunity_y,
                                        lc_m: lcOpportunity_m,
                                        lc_d: lcOpportunity_d,
                                        end_y: endOpportunity_y,
                                        end_m: endOpportunity_m,
                                        end_d: endOpportunity_d,
                                        operator: operatorOpportunity,
                                        manufacturer: manufacturerOpportunity,
                                        isAction: true,
                                        action: askOpportunity(),
                                      )),
                            );
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text(
                            'MER-A Spirit',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => basicRoverSpec(
                                        appbarContentSize: .07,
                                        full_name: nameSpirit,
                                        shrt_name: nickSpirit,
                                        type: typeSpirit,
                                        launch_y: launchSpirit_y,
                                        launch_m: launchSpirit_m,
                                        launch_d: launchSpirit_d,
                                        arrive_y: arriveSpirit_y,
                                        arrive_m: arriveSpirit_m,
                                        arrive_d: arriveSpirit_d,
                                        lc_y: lcSpirit_y,
                                        lc_m: lcSpirit_m,
                                        lc_d: lcSpirit_d,
                                        end_y: endSpirit_y,
                                        end_m: endSpirit_m,
                                        end_d: endSpirit_d,
                                        operator: operatorSpirit,
                                        manufacturer: manufacturerSpirit,
                                        isAction: true,
                                        action: askSpirit(),
                                      )),
                            );
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: Text(
                            'Sojourner',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.black54),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => basicRoverSpec(
                                        appbarContentSize: .07,
                                        full_name: nameSojourner,
                                        shrt_name: nickSojourner,
                                        type: typeSojourner,
                                        launch_y: launchSojourner_y,
                                        launch_m: launchSojourner_m,
                                        launch_d: launchSojourner_d,
                                        arrive_y: arriveSojourner_y,
                                        arrive_m: arriveSojourner_m,
                                        arrive_d: arriveSojourner_d,
                                        lc_y: lcSojourner_y,
                                        lc_m: lcSojourner_m,
                                        lc_d: lcSojourner_d,
                                        end_y: endSojourner_y,
                                        end_m: endSojourner_m,
                                        end_d: endSpirit_d,
                                        operator: operatorSojourner,
                                        manufacturer: manufacturerSojourner,
                                        isAction: false,
                                        action: null,
                                      )),
                            );
                          },
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('vehicleMenuClose'),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05,
                          ),
                        ),
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
                              fontSize: MediaQuery.of(context).size.width * .1,
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
