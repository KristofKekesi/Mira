// Flutter
import 'package:flutter/material.dart';

// widgets
import '../widgets/promo.dart';
import '../widgets/appbar.dart';
import '../widgets/text_styles.dart';

// utils
import '../utils/localization.dart';
import '../utils/extensions.dart';
import '../pass.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({Key? key}) : super(key: key);

  List<Application> miraCollection() {
    List<Application> _applications = [];
    if (appTitle != "NASA Mira") {
      _applications.add(
        const Application(
          name: "NASA Mira",
          logo: "assets/nasa-black.png",
          background: "assets/nasa-background.jpg",
        ),
      );
    }
    if (appTitle != "ESA Mira") {
      _applications.add(
        const Application(
          name: "ESA Mira",
          logo: "assets/esa-black.png",
          background: "assets/esa-background.jpg",
        ),
      );
    }
    if (appTitle != "USSR Mira") {
      _applications.add(
        const Application(
          name: "USSR Mira",
          logo: "assets/ussr-black.png",
          background: "assets/ussr-background.jpg",
        ),
      );
    }

    return _applications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Opacity(
                  opacity: 0,
                  child: Appbar(
                    title: AppLocalizations.of(context).translate("settings"),
                    rightAction: const AppBarAction(
                      icon: Icons.arrow_forward_rounded,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .03,
                    left: MediaQuery.of(context).size.width * .1,
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate("miraCollection"),
                    style: SpaceJamTextStyles.headline(context),
                  ),
                ),
                PromoWidget(
                  children: miraCollection(),
                  height: MediaQuery.of(context).size.width * .325,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate("otherApps"),
                    style: SpaceJamTextStyles.headline(context),
                  ),
                ),
                PromoWidget(
                  children: const [
                    Application(
                      name: "Elements",
                      logo: "assets/elements-black.png",
                      themeColor: Color(0xff198db3),
                    ),
                    Application(
                      name: "Preacher",
                      logo: "assets/preacher-black.png",
                      themeColor: Colors.red,
                    ),
                  ],
                  height: MediaQuery.of(context).size.width * .25,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate("legal"),
                    style: SpaceJamTextStyles.headline(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * .05 / 4),
                        child: GestureDetector(
                          onTap: () {
                            showLicensePage(
                              context: context,
                              applicationIcon: Image(
                                image: const AssetImage(appLogo),
                                width: MediaQuery.of(context).size.width * .5,
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context).translate('licenses'),
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: (MediaQuery.of(context).size.height +
                                      MediaQuery.of(context).size.width) /
                                  2 *
                                  .03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * .05),
                        child: Text(
                          appTitle,
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
                      Text(
                        "3.0.0 [12]",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontSize: (MediaQuery.of(context).size.height +
                                  MediaQuery.of(context).size.width) /
                              2 *
                              .03,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * .05),
                        child: Text(
                          AppLocalizations.of(context)
                                  .translate('name')
                                  .capitalize() +
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
                ),
              ],
            ),
            Appbar(
              title: AppLocalizations.of(context).translate("settings"),
              rightAction: AppBarAction(
                icon: Icons.arrow_forward_rounded,
                tooltip: AppLocalizations.of(context).translate("back"),
                action: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void autoAboutDialog(context) {
  showAboutDialog(
    context: context,
    applicationVersion: '3.0.0',
    applicationName: appTitle,
    applicationLegalese: 'Kristóf Kékesi',
    applicationIcon: Image.asset(
      appLogo,
      width: 120,
      height: 120,
    ),
  );
}
