// Flutter
import 'package:flutter/material.dart';
import '../pass.dart';

// pages
import 'drawer.dart';

// utils
import '../utils/localization.dart';

// widgets
import '../widgets/apod.dart';
import '../widgets/appbar.dart';
import '../widgets/collection.dart';
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
                    const Opacity(
                      opacity: 0,
                      child: Appbar(
                        title: appTitle,
                        rightAction: AppBarAction(
                          icon: Icons.menu,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05),
                      child: Column(
                        children: [
                          const ApodWidget(),
                          Collection(
                              isVisible: notifierAreOrbitersVisible,
                              inputType: "type",
                              filter: "orbiter",
                              outputType: "type"),
                          Collection(
                              isVisible: notifierAreLandersVisible,
                              inputType: "type",
                              filter: "lander",
                              outputType: "type"),
                          Collection(
                              isVisible: notifierAreFlybysVisible,
                              inputType: "type",
                              filter: "flyby",
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
            title: appTitle,
            rightAction: AppBarAction(
              icon: Icons.menu,
              tooltip: AppLocalizations.of(context).translate("selectors"),
              action: () {
                showSelectors(context, "main", false);
              },
            ),
          ),
        ],
      ),
      drawer: const SidebarDrawer(),
    );
  }
}
