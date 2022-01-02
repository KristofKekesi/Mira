// Flutter
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/text_styles.dart';

// utils
import '../utils/localization.dart';
import '../utils/extensions.dart';

// widgets
import '../widgets/promo.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({Key? key}) : super(key: key);

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
                  children: const [
                    Application(
                      name: "USSR Mira",
                      logo: "lib/images/nasa-black.png",
                      themeColor: Color(0xffE8672D),
                    ),
                    Application(
                      name: "USSR Mira",
                      logo: "lib/images/ussr-black.png",
                      themeColor: Color(0xffd02717),
                    ),
                    Application(
                      name: "ESA Mira",
                      logo: "lib/images/esa-black.png",
                      themeColor: Color(0xff0b29d2),
                    ),
                  ],
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
                      logo: "lib/images/elements-black.png",
                      themeColor: Color(0xff198db3),
                    ),
                    Application(
                      name: "Preacher",
                      logo: "lib/images/preacher-black.png",
                      themeColor: Color(0xffd02717),
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
                                image: const AssetImage(
                                    "lib/images/ussr-logo.png"),
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
                          "USSR Mira",
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
    applicationName: 'USSR Mira',
    applicationLegalese: 'Kristóf Kékesi',
    applicationIcon: Image.asset(
      'lib/images/ussr-logo.png',
      width: 120,
      height: 120,
    ),
  );
}
