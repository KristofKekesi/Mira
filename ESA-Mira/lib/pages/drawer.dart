// Flutter
import "package:flutter/material.dart";

// widgets
import "../widgets/promo.dart";
import "../widgets/appbar.dart";
import "../widgets/text_styles.dart";

// utils
import "../utils/localization.dart";
import "../utils/extensions.dart";
import "../pass.dart";

/// Drawer of the app.
class SidebarDrawer extends StatelessWidget {
  /// Constructor
  const SidebarDrawer({Key? key}) : super(key: key);

  /// All the apps of the MIRA Collection but this.
  List<Application> miraCollection() {
    final List<Application> applications = <Application>[];
    if (appTitle != "NASA Mira") {
      applications.add(
        const Application(
          name: "NASA Mira",
          logo: "assets/nasa-black.png",
          background: "assets/nasa-background.jpg",
        ),
      );
    }
    if (appTitle != "ESA Mira") {
      applications.add(
        const Application(
          name: "ESA Mira",
          logo: "assets/esa-black.png",
          background: "assets/esa-background.jpg",
        ),
      );
    }
    if (appTitle != "USSR Mira") {
      applications.add(
        const Application(
          name: "USSR Mira",
          logo: "assets/ussr-black.png",
          background: "assets/ussr-background.jpg",
        ),
      );
    }

    return applications;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    height: MediaQuery.of(context).size.width * .325,
                    children: miraCollection(),
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
                    height: MediaQuery.of(context).size.width * .25,
                    children: const <Application>[
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
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * .05 / 4,
                          ),
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
                              AppLocalizations.of(context)
                                  .translate("licenses"),
                              style: SpaceJamTextStyles.caption(
                                context,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * .04,
                          ),
                          child: Text(
                            appTitle,
                            style: SpaceJamTextStyles.caption(
                              context,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          "3.0.0 [12]",
                          style: SpaceJamTextStyles.caption(
                            context,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * .03,
                          ),
                          child: Text(
                            "${AppLocalizations.of(context)
                                .translate("name").capitalize()}"
                            "[${AppLocalizations.of(context)
                                .translate("key")}]",
                            style: SpaceJamTextStyles.caption(
                              context,
                              color: Colors.black,
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
