import 'package:flutter/material.dart';
import 'package:nasamira/widgets/localization.dart';
import 'package:nasamira/widgets/promo.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      child: Drawer(
        child:
        Container(
      color: Colors.white,
      child: ListView(
          children: <Widget>[
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
                        fontSize: (MediaQuery.of(context).size.height +MediaQuery.of(context).size.width) / 2  * .04),
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
                      fontSize: (MediaQuery.of(context).size.height +MediaQuery.of(context).size.width) / 2  * .04),
                ),
              ),
            ),
            Divider(
              thickness: MediaQuery.of(context).size.height * .005,
            ),
            PromoWidget(),
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
                      fontSize: (MediaQuery.of(context).size.height +MediaQuery.of(context).size.width) / 2  * .04),
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
                            fontSize: (MediaQuery.of(context).size.height +MediaQuery.of(context).size.width) / 2  * .04),),),),
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
                    fontSize: (MediaQuery.of(context).size.height +MediaQuery.of(context).size.width) / 2  * .04,),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}

void autoAboutDialog(context) {
  showAboutDialog(
      context: context,
      applicationVersion: '3.0.0',
      applicationName: 'NASA Mira',
      applicationLegalese: 'Kristóf Kékesi',
      );
}
