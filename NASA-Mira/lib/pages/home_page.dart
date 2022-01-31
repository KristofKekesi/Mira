// Flutter
import "package:flutter/material.dart";
import "package:spacejam/spacejam.dart";

// pages
import "drawer.dart";

// utils
import "../utils/localization.dart";
import "../pass.dart";

// widgets
import "../widgets/apod.dart";
import "../widgets/collection.dart";
import "../widgets/selector.dart";

/// The homepage, the first page the user sees.
class HomePage extends StatelessWidget {
  /// Constructor
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Opacity(
                        opacity: 0,
                        child: SpaceJamAppBar(
                          title: appTitle,
                          rightAction: SpaceJamAppBarAction(
                            Icons.menu,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                        ),
                        child: Column(
                          children: <Widget>[
                            const ApodWidget(),
                            Collection(
                              isVisible: notifierAreHelicoptersVisible,
                              inputType: "type",
                              filter: "helicopter",
                              outputType: "type",
                            ),
                            Collection(
                              isVisible: notifierAreRoversVisible,
                              inputType: "type",
                              filter: "rover",
                              outputType: "type",
                            ),
                            Collection(
                              isVisible: notifierAreOrbitersVisible,
                              inputType: "type",
                              filter: "orbiter",
                              outputType: "type",
                            ),
                            Collection(
                              isVisible: notifierAreLandersVisible,
                              inputType: "type",
                              filter: "lander",
                              outputType: "type",
                            ),
                            Collection(
                              isVisible: notifierAreFlybysVisible,
                              inputType: "type",
                              filter: "flyby",
                              outputType: "type",
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width * .05,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SpaceJamAppBar(
              title: appTitle,
              rightAction: SpaceJamAppBarAction(
                Icons.menu,
                tooltip: AppLocalizations.of(context).translate("selectors"),
                action: () {
                  showSelectors(context);
                },
              ),
            ),
          ],
        ),
        drawer: const SidebarDrawer(),
      );
}
