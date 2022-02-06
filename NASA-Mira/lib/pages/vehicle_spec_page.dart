// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:spacejam/spacejam.dart";
import "package:flutter/material.dart";

// pages
import "../widgets/min.dart";
import "vehicle_search.dart";
import "date_picker.dart";

// utils
import "../utils/localization.dart";
import "../utils/extensions.dart";
import "../pass.dart";

/// [AutoSizeGroup] of the texts with title parameters.
AutoSizeGroup specPageBigText = AutoSizeGroup();

/// Shows the specifiactions of a vehicle.
class RoverSpecPage extends StatefulWidget {
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
  RoverSpecPageState createState() => RoverSpecPageState();
}

/// The stateful part of the widget.
class RoverSpecPageState extends State<RoverSpecPage> {
  @override
  Widget build(BuildContext context) {
    late String launchY;
    late String launchM;
    late String launchD;

    void getLaunchDate() {
      if (widget.launch != null) {
        launchY = widget.launch!["year"].toString();
        launchM = spacerZeros(
          widget.launch!["month"],
        );
        launchD = spacerZeros(
          widget.launch!["day"],
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
      if (widget.arrive != null) {
        arriveY = widget.arrive!["year"].toString();
        arriveM = spacerZeros(
          widget.arrive!["month"],
        );
        arriveD = spacerZeros(
          widget.arrive!["day"],
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
      if (widget.deactivated != null) {
        endY = widget.deactivated!["year"].toString();
        endM = spacerZeros(
          widget.deactivated!["month"],
        );
        endD = spacerZeros(
          widget.deactivated!["day"],
        );
      } else if (widget.connectionLost != null) {
        endY = widget.connectionLost!["year"].toString();
        endM = spacerZeros(widget.connectionLost!["month"]);
        endD = spacerZeros(widget.connectionLost!["day"]);
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
      if (widget.end != null) {
        missionEndY = widget.end!["year"].toString();
        missionEndM = spacerZeros(
          widget.end!["month"],
        );
        missionEndD = spacerZeros(
          widget.end!["day"],
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
            child: SpaceJamButton(
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
            child: SpaceJamButton(
              title: widget.name,
              valueFontSize: MediaQuery.of(context).size.width * .08,
              titleFontSize: MediaQuery.of(context).size.width * .05,
              value: '"$nick"',
              valueSizeGroup: specPageBigText,
            ),
          );

    final List<Widget> actionWidget = <Widget>[
      widget.apiEnabled
          ? Padding(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .02,
              ),
              child: Center(
                child: SpaceJamButton(
                  backgroundColor: Colors.white,
                  valueTextStyle: SpaceJamTextStyles.headline(context),
                  valueFontSize: MediaQuery.of(context).size.width * .08,
                  titleFontSize: MediaQuery.of(context).size.width * .06,
                  tooltip: AppLocalizations.of(context)
                      .translate("searchImage")
                      .replaceAll("{0}", widget.type),
                  value: AppLocalizations.of(context).translate("images"),
                  autoSizeTextStyle: AutoSizeTextStyle(group: specPageBigText),
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (BuildContext context) =>
                            DatePickerPage(dataSector: widget.dataSector),
                      ),
                    );
                  },
                ),
              ),
            )
          : const Min(),
    ];

    String appbarTitle() => widget.nick == null ? widget.name : widget.nick!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SpaceJamPage(
        title: appbarTitle(),
        locale: AppLocalizations.of(context).locale,
        appBarLeftAction: SpaceJamAppBarAction(
          Icons.arrow_back_rounded,
          tooltip: AppLocalizations.of(context).translate("back"),
          action: () {
            Navigator.pop(context);
          },
        ),
        children: <Widget>[
          SpaceJamContainer(
            title: appbarTitle(),
            backgroundImage: const DecorationImage(
              image: AssetImage(appBackground),
              fit: BoxFit.cover,
            ),
            child: Column(
              children: <Widget>[
                missionWidget(widget.mission),
                nicknameWidget(widget.nick),
                SpaceJamButton(
                  valueFontSize: MediaQuery.of(context).size.width * .08,
                  titleFontSize: MediaQuery.of(context).size.width * .05,
                  title:
                      AppLocalizations.of(context).translate("roverSpecType"),
                  value: AppLocalizations.of(context).translate(widget.type),
                  valueSizeGroup: specPageBigText,
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (BuildContext context) => VehicleSearch(
                          type: "type",
                          value: widget.type,
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
                            style: SpaceJamTextStyles.headlineSmall(
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
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("day"),
                                child: Text(
                                  launchD,
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("year"),
                                child: Text(
                                  launchY,
                                  style: SpaceJamTextStyles.bodyMedium(
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
                            style: SpaceJamTextStyles.headlineSmall(
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
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("day"),
                                child: Text(
                                  arriveD,
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("year"),
                                child: Text(
                                  arriveY,
                                  style: SpaceJamTextStyles.bodyMedium(
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
                            widget.deactivated != null
                                ? AppLocalizations.of(context)
                                    .translate("roverSpecDeactivatedMin")
                                : AppLocalizations.of(context)
                                    .translate("roverSpecLastMin"),
                            style: SpaceJamTextStyles.headlineSmall(
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
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("day"),
                                child: Text(
                                  endD,
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("year"),
                                child: Text(
                                  endY,
                                  style: SpaceJamTextStyles.bodyMedium(
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
                            style: SpaceJamTextStyles.headlineSmall(
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
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("day"),
                                child: Text(
                                  missionEndD,
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                              Text(
                                "/",
                                style: SpaceJamTextStyles.bodyMedium(
                                  context,
                                ),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("year"),
                                child: Text(
                                  missionEndY,
                                  style: SpaceJamTextStyles.bodyMedium(
                                    context,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "* ${widget.deactivated != null ?
                        AppLocalizations.of(context)
                            .translate("roverSpecDeactivated") :
                        AppLocalizations.of(context)
                            .translate("roverSpecLast")}",
                        style: SpaceJamTextStyles.bodySmall(
                          context,
                        ),
                      ),
                      Text(
                        "** ${AppLocalizations.of(context)
                            .translate("roverSpecEnd")}",
                        style: SpaceJamTextStyles.bodySmall(
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SpaceJamButton(
                      valueFontSize: MediaQuery.of(context).size.width * .08,
                      titleFontSize: MediaQuery.of(context).size.width * .05,
                      title: AppLocalizations.of(context)
                          .translate("roverSpecOperator"),
                      value: widget.operator.join(", "),
                      valueSizeGroup: specPageBigText,
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                            builder: (BuildContext context) => VehicleSearch(
                              type: "operator",
                              value: widget.operator.join(", "),
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
                    SpaceJamButton(
                      valueFontSize: MediaQuery.of(context).size.width * .08,
                      titleFontSize: MediaQuery.of(context).size.width * .05,
                      title: AppLocalizations.of(context)
                          .translate("roverSpecManufacturer"),
                      value: widget.manufacturer,
                      valueSizeGroup: specPageBigText,
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                            builder: (BuildContext context) => VehicleSearch(
                              type: "manufacturer",
                              value: widget.manufacturer,
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
          ),
        ],
      ),
    );
  }
}
