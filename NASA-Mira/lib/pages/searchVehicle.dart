import 'package:flutter/material.dart';

import '../widgets/appbars.dart';
import '../widgets/localization.dart';
import '../widgets/roverGrid.dart';

class VehicleSearch extends StatelessWidget {
  final String type;
  final String value;

  const VehicleSearch({Key key, this.type, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchContent() {
      switch (type) {
        case "mission": {
          return value;
        }
        break;

        case "type": {
          return AppLocalizations.of(context).translate(value + "s");
        }
        break;

        case "operator": {
          return value;
        }
        break;

        case "manufacturer": {
          return value;
        }
        break;
      }
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Opacity(
                  opacity: 0,
                  child: Appbar(
                    // TODO localize
                    title: "Search for",
                    subtitle: searchContent(),
                    leftAction: Padding(
                      padding: EdgeInsets.only(
                          right: (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .02),
                      child: Tooltip(
                        message: AppLocalizations.of(context).translate("back"),
                        child: Icon(
                          Icons.arrow_back,
                          size: MediaQuery.of(context).size.width * .075,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    rightAction: Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Tooltip(
                        message:
                            AppLocalizations.of(context).translate("settings"),
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
                      RoverGrid(
                          ValueNotifier(true), ValueNotifier(true), "orbiter"),
                      Container(
                        height: MediaQuery.of(context).size.width * .05,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Appbar(
            // TODO localize
            title: "Search for",
            subtitle: searchContent(),
            leftAction: Padding(
              padding: EdgeInsets.only(
                  right: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .02),
              child: Tooltip(
                message: AppLocalizations.of(context).translate("back"),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.width * .075,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            rightAction: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .05,
              ),
              child: Tooltip(
                message: AppLocalizations.of(context).translate("settings"),
                child: GestureDetector(
                  onTap: () {},
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
    );
  }
}
