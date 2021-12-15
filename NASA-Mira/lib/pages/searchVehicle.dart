// @dart=2.9

import 'package:flutter/material.dart';

import '../widgets/selector.dart';
import '../widgets/appbars.dart';
import '../utils/localization.dart';
import '../widgets/roverGrid.dart';

bool isReverse = false;
ValueNotifier<bool> sortIsReverse = ValueNotifier<bool>(isReverse);

class VehicleSearch extends StatelessWidget {
  final String type;
  final String value;

  const VehicleSearch({Key key, this.type, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchContent() {
      switch (type) {
        case "mission":
          {
            return value;
          }
          break;

        case "type":
          {
            return AppLocalizations.of(context).translate(value + "s");
          }
          break;

        case "operator":
          {
            return value;
          }
          break;

        case "manufacturer":
          {
            return value;
          }
          break;

        default:
          {
            return "";
          }
          break;
      }
    }

    String outputType() {
      switch (type) {
        case "mission":
          {
            return "type";
          }
          break;

        case "type":
          {
            return "mission";
          }
          break;

        case "operator":
          {
            return "manufacturer";
          }
          break;

        case "manufacturer":
          {
            return "operator";
          }
          break;

        default:
          {
            return "";
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
                          Icons.arrow_back_rounded,
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
                      RoverGrid(isVisible: ValueNotifier(true), inputType: type, filter: value,
                          outputType: outputType(), errorString: searchContent()),
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
                    Icons.arrow_back_rounded,
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
                  onTap: () {
                    showSelectors(context, "search", true);
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
    );
  }
}