// Flutter
import 'package:flutter/material.dart';

// pages
import 'drawer.dart';

// utils
import '../utils/localization.dart';

// widgets
import '../widgets/apod.dart';
import '../widgets/appbars.dart';
import '../widgets/roverGrid.dart';
import '../widgets/selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Opacity(
                      opacity: 0,
                      child: Appbar(
                        title: AppLocalizations.of(context).translate("title"),
                        leftAction: Container(),
                        rightAction: Padding(
                          padding: EdgeInsets.only(
                              right: (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                                  2 *
                                  .04),
                          child: Tooltip(
                            message: AppLocalizations.of(context)
                                .translate("settings"),
                            child: Icon(
                              Icons.menu,
                              size: MediaQuery.of(context).size.width * .075,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * .03,
                          ),
                          const ApodWidget(),
                          RoverGrid(isVisible: notifierAreHelicoptersVisible, inputType: "type",
                              filter: "helicopter", outputType: "type"),
                          RoverGrid(isVisible: notifierAreRoversVisible, inputType: "type", filter: "rover",
                              outputType: "type"),
                          RoverGrid(isVisible: notifierAreOrbitersVisible, inputType: "type", filter: "orbiter",
                              outputType: "type"),
                          RoverGrid(isVisible: notifierAreLandersVisible, inputType: "type", filter: "lander",
                              outputType: "type"),
                          RoverGrid(isVisible: notifierAreFlybysVisible, inputType: "type", filter: "flyby",
                              outputType: "type"),
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
          Appbar(
            title: AppLocalizations.of(context).translate("title"),
            rightAction: Padding(
              padding: EdgeInsets.only(
                  right: (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                      2 *
                      .04),
              child: Tooltip(
                message: AppLocalizations.of(context).translate("settings"),
                child: GestureDetector(
                  onTap: () {
                    showSelectors(context, "main", false);
                  },
                  child: Icon(
                    Icons.menu,
                    size: MediaQuery.of(context).size.width * .075,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: SidebarDrawer(),
    );
  }
}