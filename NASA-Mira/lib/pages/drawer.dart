// Dart
import 'dart:ui';

// Flutter
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

// utils
import '../utils/localization.dart';
import '../utils/extensions.dart';

// widgets
import '../widgets/promo.dart';

String capitalize(input) {
  return input[0].toUpperCase() + input.substring(1);
}

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({Key? key}) : super(key: key);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              ListView(
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
                          AppLocalizations.of(context)
                              .translate('contributors'),
                          style: TextStyle(
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: (MediaQuery.of(context).size.height +
                                      MediaQuery.of(context).size.width) /
                                  2 *
                                  .04),
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
                            fontSize: (MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.width) /
                                2 *
                                .04),
                      ),
                    ),
                  ),
      Divider(
                    thickness: MediaQuery.of(context).size.height * .005,
                  ),
                  const PromoWidget(),
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
                            fontSize: (MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.width) /
                                2 *
                                .04),
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
                        AppLocalizations.of(context).translate('moreInfo'),
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: (MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.width) /
                                2 *
                                .04),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: MediaQuery.of(context).size.height * .005,
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context).translate('name').capitalize() +
                          ' [' +
                          AppLocalizations.of(context).translate('key') +
                          ']',
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: (MediaQuery.of(context).size.height +
                                MediaQuery.of(context).size.width) /
                            2 *
                            .03,
                      ),
                    ),
                  ),
                ],
              ),
              ColorfulSafeArea(
                bottom: false,
                left: false,
                right: false,
                filter: ImageFilter.blur(
                    sigmaX: (MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.width) /
                        2 *
                        .02,
                    sigmaY: (MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.width) /
                        2 *
                        .02),
                child: Container(),
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
    applicationVersion: '3.0.0',
    applicationName: 'NASA Mira',
    applicationLegalese: 'Kristóf Kékesi',
    applicationIcon: Image.asset(
      'lib/images/mira_logo.png',
      width: 120,
      height: 120,
    ),
  );
}
