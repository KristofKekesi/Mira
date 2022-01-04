// Dart
import 'dart:convert';

// Flutter
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// widgets
import 'min.dart';
import 'selector.dart';

// pages
import '../pages/vehicle_spec_page.dart';

// utils
import '../utils/localization.dart';
import '../utils/update.dart';

List<dynamic> hardCodeData = [];
var roverGridCaption = AutoSizeGroup();
var roverGridTitle = AutoSizeGroup();
int counter = 0;

class _CollectionInner extends StatelessWidget {
  final String inputType;
  final String filter;

  final List<dynamic> data;

  final String errorString;

  const _CollectionInner(
      {Key? key,
      required this.inputType,
      required this.filter,
      required this.data,
      this.errorString = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> roverList = [];
    for (var index = 0; index < data.length; index++) {
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
          Tooltip(
            message: AppLocalizations.of(context).translate("more"),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoverSpecPage(
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
                          )),
                );
              },
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .0125),
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/esa-background.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular((MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .38749,
                  height: MediaQuery.of(context).size.height * .2,
                  child: Padding(
                    padding: EdgeInsets.all((MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            data[index]["mission"] == null
                                ? const Min()
                                : AutoSizeText(
                                    data[index]["mission"],
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          (MediaQuery.of(context).size.height *
                                              .02),
                                    ),
                                    group: roverGridCaption,
                                    maxLines: 1,
                                    minFontSize: 1,
                                  ),
                            AutoSizeText(
                              data[index]["nick"] ?? data[index]["name"],
                              group: roverGridTitle,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * .025,
                              ),
                              minFontSize: 1,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AutoSizeText(
                                  AppLocalizations.of(context)
                                      .translate("state"),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        (MediaQuery.of(context).size.height *
                                            .02),
                                  ),
                                  group: roverGridCaption,
                                  maxLines: 1,
                                  minFontSize: 1,
                                ),
                                data[index]["status"] == "active"
                                    ? Text(
                                        AppLocalizations.of(context)
                                            .translate("active"),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: (MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .025),
                                        ),
                                      )
                                    : Text(
                                        AppLocalizations.of(context)
                                            .translate("inactive"),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: (MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .025),
                                        ),
                                      ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: MediaQuery.of(context).size.width * .075,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * .825,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 0,
        runSpacing: 0,
        children: roverList,
      ),
    );
  }
}

class Collection extends StatefulWidget {
  final ValueNotifier<bool> isVisible;

  final String inputType;
  final String filter;
  final String outputType;

  final String errorString;

  const Collection(
      {Key? key,
      required this.isVisible,
      required this.inputType,
      required this.filter,
      required this.outputType,
      this.errorString = ""})
      : super(key: key);

  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    // for sort
    return ValueListenableBuilder(
      builder: (BuildContext context, bool value, Widget? child) {
        Widget _roverGridInnerWithSort() {
          if (notifierIsReverse.value) {
            return _CollectionInner(
              data: hardCodeData.reversed.toList(),
              inputType: widget.inputType,
              filter: widget.filter,
              errorString: widget.errorString,
            );
          } else {
            return _CollectionInner(
              data: hardCodeData,
              inputType: widget.inputType,
              filter: widget.filter,
              errorString: widget.errorString,
            );
          }
        }

        return ValueListenableBuilder(
          builder: (BuildContext context, bool value, Widget? child) {
            if (widget.isVisible.value) {
              return FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/data.json'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      hardCodeData = json.decode(snapshot.data.toString());
                      if (counter == 0) {
                        counter++;
                        update(hardCodeData).then((e) {
                          if (updated == true) {
                            setState(() {});
                          }
                        });
                      }
                      if (updated == false) {
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * .05,
                                left: (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .04,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  AppLocalizations.of(context)
                                          .translateWithoutNullSafety(
                                              widget.filter + "s") ??
                                      widget.errorString,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        (MediaQuery.of(context).size.width +
                                                MediaQuery.of(context)
                                                    .size
                                                    .height) /
                                            2 *
                                            .05,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            _roverGridInnerWithSort(),
                          ],
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * .05,
                                  left: (MediaQuery.of(context).size.width +
                                          MediaQuery.of(context).size.height) /
                                      2 *
                                      .04,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)
                                          .translateWithoutNullSafety(
                                              widget.filter + "s") ??
                                      widget.errorString,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        (MediaQuery.of(context).size.width +
                                                MediaQuery.of(context)
                                                    .size
                                                    .height) /
                                            2 *
                                            .05,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            _roverGridInnerWithSort(),
                          ],
                        );
                      }
                    } else {
                      return Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.filter,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .05,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Min(),
                        ],
                      );
                    }
                  });
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
}
