import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import 'package:nasamira/pages/roverSpecPage.dart';
import 'package:nasamira/widgets/localization.dart';
import 'package:nasamira/widgets/update.dart';

List<dynamic> hardCodeData = [];
var roverGridMission = AutoSizeGroup();
var roverGridTitle = AutoSizeGroup();
int counter = 0;

class _RoverGridInner extends StatelessWidget {
  final type;
  final data;

  const _RoverGridInner({Key key, this.type, this.data}) : super(key: key);

  String displayedName(name, nick) {
    if (nick != null) {
      return nick;
    } else {
      return name;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> roverList = [];
    for (var index = 0; index < data.length; index++) {
      for (var innerIndex = 0;
          innerIndex < data[index]["type"].length;
          innerIndex++) {
        if (data[index]["type"][innerIndex] == type) {
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
                              url: data[index]["url"],
                              mission: data[index]["mission"],
                              name: data[index]["name"],
                              nick: data[index]["nick"],
                              type: data[index]["type"],
                              launch: data[index]["launch"],
                              arrive: data[index]["arrive"],
                              deactivated: data[index]["deactivated"],
                              connectionLost: data[index]["connection-lost"],
                              end: data[index]["end"],
                              defaultPosition: data[index]["default"],
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
                      image: DecorationImage(
                        image: AssetImage('lib/images/background.jpg'),
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
                      padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.width +
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
                              Conditional.single(
                                context: context,
                                conditionBuilder: (BuildContext context) =>
                                    data[index]["mission"] == null,
                                widgetBuilder: (BuildContext context) =>
                                    Container(),
                                fallbackBuilder: (BuildContext context) =>
                                    AutoSizeText(
                                  data[index]["mission"],
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        (MediaQuery.of(context).size.height *
                                            .02),
                                  ),
                                  group: roverGridMission,
                                  maxLines: 1,
                                  minFontSize: 1,
                                ),
                              ),
                              AutoSizeText(
                                displayedName(data[index]["name"], data[index]["nick"]),
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
                                  Text(
                                    AppLocalizations.of(context)
                                        .translate("state"),
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          (MediaQuery.of(context).size.height *
                                              .02),
                                    ),
                                  ),
                                  Conditional.single(
                                    context: context,
                                    conditionBuilder: (BuildContext context) =>
                                        data[index]["status"] == "active",
                                    widgetBuilder: (BuildContext context) =>
                                        Text(
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
                                    ),
                                    fallbackBuilder: (BuildContext context) =>
                                        Text(
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
          // safety if one type is present more than once
          break;
        }
      }
    }
    return Container(
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

class RoverGrid extends StatefulWidget {
  final ValueNotifier<bool> isReverse;
  final ValueNotifier<bool> isVisible;
  final String type;

  RoverGrid(this.isReverse, this.isVisible, this.type);

  @override
  _RoverGridState createState() => _RoverGridState();
}

class _RoverGridState extends State<RoverGrid> {
  @override
  Widget build(BuildContext context) {
    // for sort
    return ValueListenableBuilder(
      builder: (BuildContext context, bool value, Widget child) {
        Widget _roverGridInnerWithSort() {
          if (widget.isReverse.value) {
            return _RoverGridInner(
              data: hardCodeData.reversed.toList(),
              type: widget.type
            );
          } else {
            return _RoverGridInner(
                data: hardCodeData,
                type: widget.type
            );
          }
        };

        // for visibility
        return ValueListenableBuilder(
      builder: (BuildContext context, bool value, Widget child) {
        if (widget.isVisible.value) {
          return FutureBuilder(
              future:
              DefaultAssetBundle.of(context).loadString('lib/data.json'),
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
                            top: MediaQuery
                                .of(context)
                                .size
                                .width * .05,
                            left: (MediaQuery
                                .of(context)
                                .size
                                .width +
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height) /
                                2 *
                                .04,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate(widget.type + "s"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (MediaQuery
                                    .of(context)
                                    .size
                                    .width +
                                    MediaQuery
                                        .of(context)
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
                              top: MediaQuery
                                  .of(context)
                                  .size
                                  .width * .05,
                              left: (MediaQuery
                                  .of(context)
                                  .size
                                  .width +
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height) /
                                  2 *
                                  .04,
                            ),
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate(widget.type + "s"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (MediaQuery
                                    .of(context)
                                    .size
                                    .width +
                                    MediaQuery
                                        .of(context)
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
                          widget.type,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: (MediaQuery
                                .of(context)
                                .size
                                .width +
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height) /
                                2 *
                                .05,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  );
                }
              });
        } else {
          return Container();
        }
      },
      valueListenable: widget.isVisible,
    );
  },
  valueListenable: widget.isReverse,);
  }
}