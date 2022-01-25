// Flutter
import 'package:flutter/material.dart';

// widgets
import '../widgets/collection.dart';
import '../widgets/selector.dart';
import '../widgets/appbar.dart';

// utils
import '../utils/localization.dart';

bool isReverse = false;
ValueNotifier<bool> sortIsReverse = ValueNotifier<bool>(isReverse);

class VehicleSearch extends StatelessWidget {
  final String type;
  final String value;

  const VehicleSearch({Key? key, required this.type, required this.value})
      : super(key: key);

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
      backgroundColor: Colors.white,
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
                    leftAction: const AppBarAction(
                      icon: Icons.arrow_back_rounded,
                    ),
                    rightAction: const AppBarAction(
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
                      Container(
                        height: MediaQuery.of(context).size.width * .03,
                      ),
                      Collection(
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
            leftAction: AppBarAction(
              icon: Icons.arrow_back_rounded,
              tooltip: AppLocalizations.of(context).translate("back"),
              action: () {
                Navigator.pop(context);
              },
            ),
            rightAction: AppBarAction(
              icon: Icons.menu,
              tooltip: AppLocalizations.of(context).translate("selectors"),
              action: () {
                showSelectors(context, "search", true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
