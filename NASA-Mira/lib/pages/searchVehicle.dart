// Flutter
import 'package:flutter/material.dart';

// widgets
import '../widgets/roverGrid.dart';
import '../widgets/selector.dart';
import '../widgets/appbars.dart';

// utils
import '../utils/localization.dart';

bool isReverse = false;
ValueNotifier<bool> sortIsReverse = ValueNotifier<bool>(isReverse);

class VehicleSearch extends StatelessWidget {
  final String type;
  final String value;

  const VehicleSearch({Key? key, required this.type, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String searchContent() {
      switch (type) {
        case "mission":
          {
            return value;
          }

        case "type":
          {
            return AppLocalizations.of(context).translate(value + "s");
          }

        case "operator":
          {
            return value;
          }

        case "manufacturer":
          {
            return value;
          }

        default:
          {
            return "";
          }
      }
    }

    String outputType() {
      switch (type) {
        case "mission":
          {
            return "type";
          }

        case "type":
          {
            return "mission";
          }

        case "operator":
          {
            return "manufacturer";
          }

        case "manufacturer":
          {
            return "operator";
          }

        default:
          {
            return "";
          }
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
                    title: AppLocalizations.of(context).translate("searchFor"),
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
                      RoverGrid(
                          isVisible: ValueNotifier(true),
                          inputType: type,
                          filter: value,
                          outputType: outputType(),
                          errorString: searchContent()),
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
            title: AppLocalizations.of(context).translate("searchFor"),
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
