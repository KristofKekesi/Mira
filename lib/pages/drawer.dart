import 'package:flutter/material.dart';
import 'package:nasamira/widgets/localization.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: non_constant_identifier_names
String Capitalizate(input) {
  return input[0].toUpperCase() + input.substring(1);
}

// ignore: camel_case_types
class customDrawer extends StatelessWidget {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  String coverImg() {
    String output;
    var current = DateTime.now();

    if (current.hour >= 6 && current.hour < 20) {
      output = 'lib/images/cover_day.jpg';
    } else {
      output = 'lib/images/cover_night.jpg';
    }

    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      child: Drawer(
        child: NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
      overscroll.disallowGlow();
      return null;
      },child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .75,
              height: (MediaQuery.of(context).size.width * .75) * .40,
              child: DrawerHeader(
                child: null,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(coverImg()), fit: BoxFit.fitWidth)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .01),
              child: GestureDetector(
                onTap: () {
                  _launchURL(
                      'https://github.com/KristofKekesi/NASA-Mira/blob/master/README.md#contributors-');
                },
                child: ListTile(
                  title: Text(
                    AppLocalizations.of(context).translate('contributors'),
                    style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .07),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL(
                    'https://github.com/KristofKekesi/NASA-Mira/blob/master/README.md#contacts-');
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('contacts'),
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .07),
                ),
              ),
            ),
            Divider(
              thickness: MediaQuery.of(context).size.height * .005,
            ),
            GestureDetector(
              onTap: () {
                _launchURL(
                    'https://github.com/KristofKekesi/NASA-Mira/blob/master/README.md#license-');
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context).translate('license'),
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .07),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  autoAboutDialog(context);
                },
                child: ListTile(
                    title: Text(
                        AppLocalizations.of(context).translate('moreinfo'),
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * .07)))),
            Divider(
              thickness: MediaQuery.of(context).size.height * .005,
            ),
            ListTile(
              title: Text(
                Capitalizate(AppLocalizations.of(context).translate('name')) +
                    ' [' +
                    AppLocalizations.of(context).translate('key') +
                    ']',
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .05),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

void autoAboutDialog(context) {
  showAboutDialog(
      context: context,
      applicationVersion: '2.0',
      applicationName: 'NASA Mira',
      applicationLegalese: 'Kristóf Kékesi',
      applicationIcon: Image.asset(
        'lib/images/mira_logo.png',
        height: 20,
        width: 20,
      ));
}
