// todo rename file to vehicle_spec_page.dart
// Flutter
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// widgets
import '../widgets/declarational_button.dart';
import '../widgets/content.dart';
import '../widgets/appbars.dart';

// pages
import '../widgets/min.dart';
import 'vehicle_search.dart';
import 'date_picker.dart';

// utils
import '../utils/localization.dart';
import '../utils/extensions.dart';

AutoSizeGroup specPageBigText = AutoSizeGroup();

class RoverSpecPage extends StatelessWidget {
  final int dataSector;

  final bool apiEnabled;

  final String? mission;
  final String name;
  final String? nick;
  final String type;
  final String operator;
  final String manufacturer;

  final Map<String, dynamic>? launch;
  final Map<String, dynamic>? arrive;
  final Map<String, dynamic>? deactivated;
  final Map<String, dynamic>? connectionLost;
  final Map<String, dynamic>? end;

  const RoverSpecPage({
    Key? key,
    required this.dataSector,
    this.apiEnabled = false,
    this.mission,
    required this.name,
    this.nick,
    required this.type,
    this.launch,
    this.arrive,
    this.connectionLost,
    this.deactivated,
    this.end,
    required this.operator,
    required this.manufacturer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String launchY;
    late String launchM;
    late String launchD;

    void getLaunchDate() {
      if (launch != null) {
        launchY = launch!["year"].toString();
        launchM = spacerZeros(
          launch!["month"],
        );
        launchD = spacerZeros(
          launch!["day"],
        );
      } else {
        launchY = "──";
        launchM = "─";
        launchD = "─";
      }
    }

    late String arriveY;
    late String arriveM;
    late String arriveD;

    void getArriveDate() {
      if (arrive != null) {
        arriveY = arrive!["year"].toString();
        arriveM = spacerZeros(
          arrive!["month"],
        );
        arriveD = spacerZeros(
          arrive!["day"],
        );
      } else {
        arriveY = "──";
        arriveM = "─";
        arriveD = "─";
      }
    }

    late String endY;
    late String endM;
    late String endD;

    void getEndDateAndPrefix() {
      if (deactivated != null) {
        endY = deactivated!["year"].toString();
        endM = spacerZeros(
          deactivated!["month"],
        );
        endD = spacerZeros(
          deactivated!["day"],
        );
      } else if (connectionLost != null) {
        endY = connectionLost!["year"].toString();
        endM = spacerZeros(connectionLost!["month"]);
        endD = spacerZeros(connectionLost!["day"]);
      } else {
        endY = "──";
        endM = "─";
        endD = "─";
      }
    }

    late String missionEndY;
    late String missionEndM;
    late String missionEndD;

    void getMissionEndDate() {
      if (end != null) {
        missionEndY = end!["year"].toString();
        missionEndM = spacerZeros(
          end!["month"],
        );
        missionEndD = spacerZeros(
          end!["day"],
        );
      } else {
        missionEndY = "──";
        missionEndM = "─";
        missionEndD = "─";
      }
    }

    getLaunchDate();
    getArriveDate();
    getEndDateAndPrefix();
    getMissionEndDate();

    Widget missionWidget(mission) {
      return mission == null
          ? const Min()
          : Padding(
              padding: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .02),
              child: DeclarationalButton(
                title:
                    AppLocalizations.of(context).translate("roverSpecMission"),
                valueFontSize: MediaQuery.of(context).size.width * .08,
                value: mission,
                valueSizeGroup: specPageBigText,
                titleFontSize: MediaQuery.of(context).size.width * .05,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleSearch(
                        type: "mission",
                        value: mission,
                      ),
                    ),
                  );
                },
              ),
            );
    }

    Widget nicknameWidget(nick) {
      return nick == null
          ? const Min()
          : Padding(
              padding: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .02),
              child: DeclarationalButton(
                title: name,
                valueFontSize: MediaQuery.of(context).size.width * .08,
                titleFontSize: MediaQuery.of(context).size.width * .05,
                value: "\"" + nick + "\"",
                valueSizeGroup: specPageBigText,
              ),
            );
    }

    List<Widget> actionWidget = [];
    actionWidget.add(
      apiEnabled
          ? Padding(
              padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .02),
              child: Center(
                child: DeclarationalButton(
                  background: Colors.white,
                  valueTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  valueFontSize: MediaQuery.of(context).size.width * .08,
                  titleFontSize: MediaQuery.of(context).size.width * .06,
                  tooltip: AppLocalizations.of(context)
                      .translate('searchImage')
                      .replaceAll("{0}", type),
                  value: AppLocalizations.of(context).translate("search"),
                  autoSizeTextStyle: AutoSizeTextStyle(group: specPageBigText),
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DatePickerPage(dataSector: dataSector),
                      ),
                    );
                  },
                ),
              ),
            )
          : Container(),
    );

    String appbarTitle() => nick == null ? name : nick!;
    String? appbarSubtitle() => nick == null ? null : name;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Opacity(
                opacity: 0,
                child: Appbar(
                  title: appbarTitle(),
                  subtitle: appbarSubtitle(),
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
                ),
              ),
              Content(
                title: nick == null ? name : nick!,
                children: [
                  missionWidget(mission),
                  nicknameWidget(nick),
                  DeclarationalButton(
                    valueFontSize: MediaQuery.of(context).size.width * .08,
                    titleFontSize: MediaQuery.of(context).size.width * .05,
                    title:
                        AppLocalizations.of(context).translate("roverSpecType"),
                    value: AppLocalizations.of(context).translate(type),
                    valueSizeGroup: specPageBigText,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VehicleSearch(
                            type: "type",
                            value: type,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02,
                  ),
                  Padding(
                    padding: EdgeInsets.all((MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('roverSpecLaunch'),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('month'),
                                  child: Text(
                                    launchM,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('day'),
                                  child: Text(
                                    launchD,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('year'),
                                  child: Text(
                                    launchY,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('roverSpecArrive'),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('month'),
                                  child: Text(
                                    arriveM,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('day'),
                                  child: Text(
                                    arriveD,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('year'),
                                  child: Text(
                                    arriveY,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              deactivated != null
                                  ? AppLocalizations.of(context)
                                      .translate("roverSpecDeactivatedMin")
                                  : AppLocalizations.of(context)
                                      .translate("roverSpecLastMin"),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('month'),
                                  child: Text(
                                    endM,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('day'),
                                  child: Text(
                                    endD,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('year'),
                                  child: Text(
                                    endY,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate('roverSpecEndMin'),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('month'),
                                  child: Text(
                                    missionEndM,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('day'),
                                  child: Text(
                                    missionEndD,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate('year'),
                                  child: Text(
                                    missionEndY,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "* " +
                              (deactivated != null
                                  ? AppLocalizations.of(context)
                                      .translate("roverSpecDeactivated")
                                  : AppLocalizations.of(context)
                                      .translate("roverSpecLast")),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .045,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "** " +
                              AppLocalizations.of(context)
                                  .translate('roverSpecEnd'),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .045,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DeclarationalButton(
                        valueFontSize: MediaQuery.of(context).size.width * .08,
                        titleFontSize: MediaQuery.of(context).size.width * .05,
                        title: AppLocalizations.of(context)
                            .translate('roverSpecOperator'),
                        value: operator,
                        valueSizeGroup: specPageBigText,
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VehicleSearch(
                                type: "operator",
                                value: operator,
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        height: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .02,
                      ),
                      DeclarationalButton(
                        valueFontSize: MediaQuery.of(context).size.width * .08,
                        titleFontSize: MediaQuery.of(context).size.width * .05,
                        title: AppLocalizations.of(context)
                            .translate('roverSpecManufacturer'),
                        value: manufacturer,
                        valueSizeGroup: specPageBigText,
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VehicleSearch(
                                type: "manufacturer",
                                value: manufacturer,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(children: actionWidget),
                ],
              ),
            ],
          ),
          Appbar(
            title: appbarTitle(),
            subtitle: appbarSubtitle(),
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
          ),
        ],
      ),
    );
  }
}
