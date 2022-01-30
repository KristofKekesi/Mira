// Flutter
import "package:flutter/material.dart";
import "package:spacejam/spacejam.dart";

// widgets
import "../widgets/collection.dart";
import "../widgets/selector.dart";

// utils
import "../utils/localization.dart";

/// Are the vehicles reversed (based on time)?
/// This variable is used in collections.
ValueNotifier<bool> sortIsReverse = ValueNotifier<bool>(false);

/// Shows vehicles based on a search.
class VehicleSearch extends StatelessWidget {
  /// Constructor
  const VehicleSearch({required this.type, required this.value, Key? key,})
      : super(key: key);

  /// The parameter that we want to query.
  final String type;
  /// The value that we are wanting to find.
  final String value;

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
            return AppLocalizations.of(context).translate("${value}s");
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
                  child: SpaceJamAppBar(
                    title: AppLocalizations.of(context).translate("searchFor"),
                    subtitle: searchContent(),
                    leftAction: const SpaceJamAppBarAction(
                      Icons.arrow_back_rounded,
                    ),
                    rightAction: const SpaceJamAppBarAction(
                      Icons.menu,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                      right: MediaQuery.of(context).size.width * .05,),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.width * .03,
                      ),
                      Collection(
                          isVisible: ValueNotifier<bool>(true),
                          inputType: type,
                          filter: value,
                          outputType: outputType(),
                          errorString: searchContent(),),
                      Container(
                        height: MediaQuery.of(context).size.width * .05,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SpaceJamAppBar(
            title: AppLocalizations.of(context).translate("searchFor"),
            subtitle: searchContent(),
            leftAction: SpaceJamAppBarAction(
              Icons.arrow_back_rounded,
              tooltip: AppLocalizations.of(context).translate("back"),
              action: () {
                Navigator.pop(context);
              },
            ),
            rightAction: SpaceJamAppBarAction(
              Icons.menu,
              tooltip: AppLocalizations.of(context).translate("selectors"),
              action: () {
                showSelectors(context, areTypesDisabled: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
