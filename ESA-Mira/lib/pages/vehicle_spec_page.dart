// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";

// widgets
import "../widgets/text_styles.dart";
import "../widgets/content_box.dart";
import "../widgets/button.dart";
import "../widgets/appbar.dart";

// pages
import "../widgets/min.dart";
import "vehicle_search.dart";
import "date_picker.dart";

// utils
import "../utils/localization.dart";
import "../utils/extensions.dart";

/// [AutoSizeGroup] of the texts with title parameters.
AutoSizeGroup specPageBigText = AutoSizeGroup();

/// Shows the specifiactions of a vehicle.
class RoverSpecPage extends StatelessWidget {
  /// Constructor
  const RoverSpecPage({
    required this.dataSector,
    required this.name,
    required this.type,
    required this.operator,
    required this.manufacturer,
    this.apiEnabled = false,
    this.mission,
    this.nick,
    this.launch,
    this.arrive,
    this.connectionLost,
    this.deactivated,
    this.end,
    Key? key,
  }) : super(key: key);

  /// Don't know what is this.
  final int dataSector;

  /// Shows that the vehicle is API enabled.
  final bool apiEnabled;

  /// The mission if the vehicle has one.
  final String? mission;

  /// The name of the vehicle.
  final String name;

  /// The nickname of the vehicle if it has one.
  final String? nick;

  /// The type of the vehicle. E.g.: rover
  final String type;

  /// The organisation who controls the vehicle.
  final List<dynamic> operator;

  /// The manufacturer of the vehicle.
  final String manufacturer;

  /// Map that contains the launch date.
  final Map<String, dynamic>? launch;

  /// Map that contains the date of arrival.
  final Map<String, dynamic>? arrive;

  /// Map that contains the date of deactivation.
  final Map<String, dynamic>? deactivated;

  /// Map that contains the date of connection lost.
  final Map<String, dynamic>? connectionLost;

  /// Map that contains the date of the end of the mission.
  final Map<String, dynamic>? end;

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

    Widget missionWidget(String? mission) => mission == null
        ? const Min()
        : Padding(
            padding: EdgeInsets.only(
              bottom: (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  .02,
            ),
            child: Button(
              title: AppLocalizations.of(context).translate("roverSpecMission"),
              valueFontSize: MediaQuery.of(context).size.width * .08,
              value: mission,
              valueSizeGroup: specPageBigText,
              titleFontSize: MediaQuery.of(context).size.width * .05,
              action: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (BuildContext context) => VehicleSearch(
                      type: "mission",
                      value: mission,
                    ),
                  ),
                );
              },
            ),
          );

    Widget nicknameWidget(String? nick) => nick == null
        ? const Min()
        : Padding(
            padding: EdgeInsets.only(
              bottom: (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  .02,
            ),
            child: Button(
              title: name,
              valueFontSize: MediaQuery.of(context).size.width * .08,
              titleFontSize: MediaQuery.of(context).size.width * .05,
              value: '"$nick"',
              valueSizeGroup: specPageBigText,
            ),
          );

    final List<Widget> actionWidget = <Widget>[
      apiEnabled
          ? Padding(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .02,
              ),
              child: Center(
                child: Button(
                  background: Colors.white,
                  valueTextStyle: SpaceJamTextStyles.headline(context),
                  valueFontSize: MediaQuery.of(context).size.width * .08,
                  titleFontSize: MediaQuery.of(context).size.width * .06,
                  tooltip: AppLocalizations.of(context)
                      .translate("searchImage")
                      .replaceAll("{0}", type),
                  value: AppLocalizations.of(context).translate("search"),
                  autoSizeTextStyle: AutoSizeTextStyle(group: specPageBigText),
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (BuildContext context) =>
                            DatePickerPage(dataSector: dataSector),
                      ),
                    );
                  },
                ),
              ),
            )
          : const Min(),
    ];

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
                  leftAction: const AppBarAction(
                    icon: Icons.arrow_back_rounded,
                  ),
                ),
              ),
              ContentBox(
                title: nick == null ? name : nick!,
                children: <Widget>[
                  missionWidget(mission),
                  nicknameWidget(nick),
                  Button(
                    valueFontSize: MediaQuery.of(context).size.width * .08,
                    titleFontSize: MediaQuery.of(context).size.width * .05,
                    title:
                        AppLocalizations.of(context).translate("roverSpecType"),
                    value: AppLocalizations.of(context).translate(type),
                    valueSizeGroup: specPageBigText,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => VehicleSearch(
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
                    padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)
                                  .translate("roverSpecLaunch"),
                              style: SpaceJamTextStyles.subHeadline(
                                context,
                                color: Colors.white70,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("month"),
                                  child: Text(
                                    launchM,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("day"),
                                  child: Text(
                                    launchD,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("year"),
                                  child: Text(
                                    launchY,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
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
                                  .translate("roverSpecArrive"),
                              style: SpaceJamTextStyles.subHeadline(
                                context,
                                color: Colors.white70,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("month"),
                                  child: Text(
                                    arriveM,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("day"),
                                  child: Text(
                                    arriveD,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("year"),
                                  child: Text(
                                    arriveY,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
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
                              style: SpaceJamTextStyles.subHeadline(
                                context,
                                color: Colors.white70,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("month"),
                                  child: Text(
                                    endM,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("day"),
                                  child: Text(
                                    endD,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("year"),
                                  child: Text(
                                    endY,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
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
                                  .translate("roverSpecEndMin"),
                              style: SpaceJamTextStyles.subHeadline(
                                context,
                                color: Colors.white70,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("month"),
                                  child: Text(
                                    missionEndM,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("day"),
                                  child: Text(
                                    missionEndD,
                                    style: SpaceJamTextStyles.defaultTextStyle(
                                      context,
                                    ),
                                  ),
                                ),
                                Text(
                                  "/",
                                  style: SpaceJamTextStyles.defaultTextStyle(
                                    context,
                                  ),
                                ),
                                Tooltip(
                                  message: AppLocalizations.of(context)
                                      .translate("year"),
                                  child: Text(
                                    missionEndY,
                                    style: SpaceJamTextStyles
                                        .defaultTextStyle(context,),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "* ${deactivated != null ?
                          AppLocalizations.of(context)
                              .translate("roverSpecDeactivated") :
                          AppLocalizations.of(context)
                              .translate("roverSpecLast")}",
                          style: SpaceJamTextStyles.caption(context,),
                        ),
                        Text(
                          "** ${AppLocalizations.of(context)
                              .translate("roverSpecEnd")}",
                          style: SpaceJamTextStyles.caption(context,),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Button(
                        valueFontSize: MediaQuery.of(context).size.width * .08,
                        titleFontSize: MediaQuery.of(context).size.width * .05,
                        title: AppLocalizations.of(context)
                            .translate("roverSpecOperator"),
                        value: operator.join(", "),
                        valueSizeGroup: specPageBigText,
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<Widget>(
                              builder: (BuildContext context) => VehicleSearch(
                                type: "operator",
                                value: operator.join(", "),
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
                      Button(
                        valueFontSize: MediaQuery.of(context).size.width * .08,
                        titleFontSize: MediaQuery.of(context).size.width * .05,
                        title: AppLocalizations.of(context)
                            .translate("roverSpecManufacturer"),
                        value: manufacturer,
                        valueSizeGroup: specPageBigText,
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<Widget>(
                              builder: (BuildContext context) => VehicleSearch(
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
            leftAction: AppBarAction(
              icon: Icons.arrow_back_rounded,
              tooltip: AppLocalizations.of(context).translate("back"),
              action: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
