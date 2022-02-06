// Ignore because working with API calls with complex Map returns.
//ignore_for_file: avoid_dynamic_calls

// Dart
import "dart:convert";

// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:spacejam/spacejam.dart";
import "package:flutter/material.dart";
import "../pass.dart";

// widgets
import "selector.dart";
import "min.dart";

// pages
import "../pages/vehicle_spec_page.dart";

// utils
import "../utils/localization.dart";
import "../utils/update.dart";

/// I don't know what this is.
List<dynamic> hardCodeData = <Widget>[];

/// An [AutoSizeGroup] for the collection to link captions together.
AutoSizeGroup roverGridCaption = AutoSizeGroup();

/// An [AutoSizeGroup] for the collection to link titles together.
AutoSizeGroup roverGridTitle = AutoSizeGroup();

/// Counter used to know when is the first time of rendering.
int counter = 0;

class _CollectionInner extends StatelessWidget {
  const _CollectionInner({
    required this.title,
    required this.inputType,
    required this.filter,
    required this.data,
    this.errorString = "",
    Key? key,
  }) : super(key: key);

  final String title;

  final String inputType;
  final String filter;

  final List<dynamic> data;

  final String errorString;

  @override
  Widget build(BuildContext context) {
    final List<SpaceJamCollectionItem> roverList = <SpaceJamCollectionItem>[];
    for (int index = 0; index < data.length; index++) {
      bool isPassed = false;
      switch (inputType) {
        case "type":
          {
            if (data[index]["type"] == filter) {
              isPassed = true;
            }
          }
          break;

        case "mission":
          {
            if (data[index]["mission"] == filter) {
              isPassed = true;
            }
          }
          break;

        case "operator":
          {
            if (data[index]["operator"].join(", ") == filter) {
              isPassed = true;
            }
          }
          break;

        case "manufacturer":
          {
            if (data[index]["manufacturer"] == filter) {
              isPassed = true;
            }
          }
          break;
      }

      if (isPassed) {
        roverList.add(
          SpaceJamCollectionItem(
            upperCaption: data[index]["mission"],
            upperValue: data[index]["nick"] ?? data[index]["name"],
            lowerCaption: AppLocalizations.of(context).translate("state"),
            lowerValue: data[index]["status"] == "active"
                ? AppLocalizations.of(context).translate("active")
                : AppLocalizations.of(context).translate("inactive"),
            tooltip: AppLocalizations.of(context).translate("more"),
            backgroundImage: const DecorationImage(
              image: AssetImage(appBackground),
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (BuildContext context) => RoverSpecPage(
                    dataSector: index,
                    apiEnabled: data[index]["api-enabled"],
                    mission: data[index]["mission"],
                    name: data[index]["name"],
                    nick: data[index]["nick"],
                    type: data[index]["type"],
                    launch: data[index]["launch"],
                    arrive: data[index]["arrive"],
                    deactivated: data[index]["deactivated"],
                    connectionLost: data[index]["connection-lost"],
                    end: data[index]["end"],
                    operator: data[index]["operator"],
                    manufacturer: data[index]["manufacturer"],
                  ),
                ),
              );
            },
          ),
        );
      }
    }

    return SpaceJamCollection(
      items: roverList,
      title: title,
    );
  }
}

/// Shows a collection with a caption.
class Collection extends StatefulWidget {
  /// Constructor
  const Collection({
    required this.isVisible,
    required this.inputType,
    required this.filter,
    required this.outputType,
    this.errorString = "",
    Key? key,
  }) : super(key: key);

  /// Visibility of the collection.
  final ValueNotifier<bool> isVisible;

  /// The input type of the collection.
  final String inputType;

  /// Filter used to filter from the inputs of the collection.
  final String filter;

  /// The output type after the filter.
  final String outputType;

  /// String used when the plural version of localization returns null.
  final String errorString;

  @override
  CollectionState createState() => CollectionState();
}

/// Stateful part of the widget.
class CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        builder: (BuildContext context, bool value, Widget? child) {
          Widget _roverGridInnerWithSort(String title) {
            if (notifierIsReverse.value) {
              return _CollectionInner(
                data: hardCodeData.reversed.toList(),
                inputType: widget.inputType,
                filter: widget.filter,
                errorString: widget.errorString,
                title: title,
              );
            } else {
              return _CollectionInner(
                data: hardCodeData,
                inputType: widget.inputType,
                filter: widget.filter,
                errorString: widget.errorString,
                title: title,
              );
            }
          }

          return ValueListenableBuilder<bool>(
            builder: (BuildContext context, bool value, Widget? child) {
              if (widget.isVisible.value) {
                return FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/data.json"),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      hardCodeData = json.decode(snapshot.data.toString());
                      if (counter == 0) {
                        counter++;
                        update(hardCodeData).then((_) {
                          if (updated == true) {
                            setState(() {});
                          }
                        });
                      }
                      return _roverGridInnerWithSort(
                        AppLocalizations.of(context).translateWithoutNullSafety(
                              "${widget.filter}s",
                            ) ??
                            widget.errorString,
                      );
                    } else {
                      return const Min();
                    }
                  },
                );
              } else {
                return const Min();
              }
            },
            valueListenable: widget.isVisible,
          );
        },
        valueListenable: notifierIsReverse,
      );
}
