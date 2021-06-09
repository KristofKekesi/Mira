import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nasamira/pages/searchVehicle.dart';
import 'package:nasamira/widgets/appbars.dart';
import 'package:nasamira/widgets/declarationalButton.dart';
import 'package:nasamira/widgets/localization.dart';

import 'datePicker.dart';

AutoSizeGroup specPageBigText = AutoSizeGroup();

class RoverSpecPage extends StatelessWidget {
  final int dataSector;

  final bool apiEnabled;

  final String url;
  final String mission;
  final String name;
  final String nick;
  final String type;
  final String operator;
  final String manufacturer;

  final launch;
  final arrive;
  final deactivated;
  final connectionLost;
  final end;

  final defaultPosition;

  const RoverSpecPage(
      {Key key,
      this.dataSector,
      this.apiEnabled,
      this.mission,
      this.name,
      this.nick,
      this.type,
      this.launch,
      this.arrive,
      this.connectionLost,
      this.deactivated,
      this.end,
      this.operator,
      this.manufacturer,
      this.defaultPosition,
      this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String launchY;
    String launchM;
    String launchD;

    String displayedName(name, nick) {
      if (nick != null) {
        return nick;
      } else {
        return name;
      }
    }

    String checkNull(int num) {
      if (num < 10) {
        return "0" + num.toString();
      } else {
        return num.toString();
      }
    }

    void getLaunchDate() {
      if (launch == null) {
        launchY = "──";
        launchM = "─";
        launchD = "─";
      } else {
        launchY = launch["year"].toString();
        launchM = checkNull(launch["month"]);
        launchD = checkNull(launch["day"]);
      }
    }

    String arriveY;
    String arriveM;
    String arriveD;

    void getArriveDate() {
      if (arrive == null) {
        arriveY = "──";
        arriveM = "─";
        arriveD = "─";
      } else {
        arriveY = arrive["year"].toString();
        arriveM = checkNull(arrive["month"]);
        arriveD = checkNull(arrive["day"]);
      }
    }

    String endY;
    String endM;
    String endD;

    String endPrefix;
    String endPrefixMin;

    void getEndDateAndPrefix() {
      if (deactivated != null) {
        endY = deactivated["year"].toString();
        endM = checkNull(deactivated["month"]);
        endD = checkNull(deactivated["day"]);

        endPrefix =
            AppLocalizations.of(context).translate("roverSpecDeactivated");
        endPrefixMin =
            AppLocalizations.of(context).translate("roverSpecDeactivatedMin");
      } else if (connectionLost != null) {
        endY = connectionLost["year"].toString();
        endM = checkNull(connectionLost["month"]);
        endD = checkNull(connectionLost["day"]);

        endPrefix = AppLocalizations.of(context).translate("roverSpecLast");
        endPrefixMin =
            AppLocalizations.of(context).translate("roverSpecLastMin");
      } else {
        endY = "──";
        endM = "─";
        endD = "─";

        endPrefix = AppLocalizations.of(context).translate("roverSpecLast");
        endPrefixMin =
            AppLocalizations.of(context).translate("roverSpecLastMin");
      }
    }

    String missionEndY;
    String missionEndM;
    String missionEndD;

    void getMissionEndDate() {
      if (end == null) {
        missionEndY = "──";
        missionEndM = "─";
        missionEndD = "─";
      } else {
        missionEndY = end["year"].toString();
        missionEndM = checkNull(end["month"]);
        missionEndD = checkNull(end["day"]);
      }
    }

    getLaunchDate();
    getArriveDate();
    getEndDateAndPrefix();
    getMissionEndDate();

    Widget missionWidget(mission) {
      if (mission == null) {
        return Container();
      } else {
        return Padding(
          padding: EdgeInsets.only(
              bottom: (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  .02),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicleSearch(
                    mission: null,
                    type: "orbiter",
                  ),
                ),
              );
            },
            child: DeclarationalButton(title: AppLocalizations.of(context)
                .translate("roverSpecMission"), value: mission, valueSizeGroup: specPageBigText,),),);
      }
    }

Widget nicknameWidget(nick) {
      if (nick == null) {
        return Container();
      } else {
        return Padding(
          padding: EdgeInsets.only(
              bottom: (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  .02),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicleSearch(
                    mission: null,
                    type: "orbiter",
                  ),
                ),
              );
            },
            child: DeclarationalButton(title: name, value: "\"" + nick + "\"", valueSizeGroup: specPageBigText,)
          ),
        );
      }
    }

    List<Widget> actionWidget = [];
    if (apiEnabled == true) {
      actionWidget.add(
        Padding(
          padding: EdgeInsets.only(
              top: (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  .04),
          child: Center(
            child: Tooltip(
              message: AppLocalizations.of(context)
                  .translate('specButton')
                  .replaceAll("{0}", type),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DatePickerPage(dataSector: dataSector),
                    ),
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context).translate('roverSpecButton'),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05,
                        color: Color(0xffE8672D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      actionWidget.add(Container());
    }

    String appbarTitle() {
      if(nick == null || nick == "") {
        return name;
      } else {
        return nick;
      }
    }

    String appbarSubtitle() {
      if(nick == null || nick == "") {
        return null;
      } else {
        return name;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: <Widget>[
          ListView(
          children: <Widget>[
            Opacity(
        opacity: 0,
        child: Appbar(
              title: appbarTitle(),
              subtitle: appbarSubtitle(),
              leftAction: Padding(
                padding: EdgeInsets.only(right: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                    2 *
                    .02),
                child: Tooltip(
            message: AppLocalizations.of(context)
            .translate("back"),
                child: GestureDetector(
          onTap: () {Navigator.pop(context);},
          child: Icon(
            Icons.arrow_back,
            size: MediaQuery.of(context).size.width * .075,
            color: Colors.black,
          ),
        ),
      ),),),),
            Padding(
              padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .04,
                bottom: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .04 +
                                MediaQuery.of(context).size.width * .05),
                        child: AutoSizeText(
                          displayedName(name, nick),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * .08,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          group: specPageBigText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/background.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  (MediaQuery.of(context).size.width +
                                          MediaQuery.of(context).size.height) /
                                      2 *
                                      .04),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * .9,
                          child: Padding(
                            padding: EdgeInsets.all(
                                (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                missionWidget(mission),
                                nicknameWidget(nick),
                                DeclarationalButton(title: AppLocalizations.of(context).translate("roverSpecType"), value: type, valueSizeGroup: specPageBigText,),
                                Container(height: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context)
                                        .size
                                        .height) /
                                    2 *
                                    .02,),
                                Padding(
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.width +
                                              MediaQuery.of(context)
                                                  .size
                                                  .height) /
                                          2 *
                                          .02),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)
                                                .translate('roverSpecLaunch'),
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .05,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('month'),
                                                child: Text(
                                                  launchM,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('day'),
                                                child: Text(
                                                  launchD,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('year'),
                                                child: Text(
                                                  launchY,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)
                                                .translate('roverSpecArrive'),
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .05,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('month'),
                                                child: Text(
                                                  arriveM,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('day'),
                                                child: Text(
                                                  arriveD,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('year'),
                                                child: Text(
                                                  arriveY,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            endPrefixMin,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .05,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('month'),
                                                child: Text(
                                                  endM,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('day'),
                                                child: Text(
                                                  endD,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('year'),
                                                child: Text(
                                                  endY,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context)
                                                .translate('roverSpecEndMin'),
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .05,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('month'),
                                                child: Text(
                                                  missionEndM,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('day'),
                                                child: Text(
                                                  missionEndD,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .05,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Tooltip(
                                                message:
                                                    AppLocalizations.of(context)
                                                        .translate('year'),
                                                child: Text(
                                                  missionEndY,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                        "* " + endPrefix,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .045,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        "** " +
                                            AppLocalizations.of(context)
                                                .translate('roverSpecEnd'),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .045,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    DeclarationalButton(title: AppLocalizations.of(context).translate('roverSpecOperator'), value: operator, valueSizeGroup: specPageBigText,),
                                    Container(height: (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context)
                                            .size
                                            .height) /
                                        2 *
                                        .02,),
                                    DeclarationalButton(title: AppLocalizations.of(context).translate('roverSpecManufacturer'), value: manufacturer, valueSizeGroup: specPageBigText,),
                                  ],
                                ),
                                Column(children: actionWidget),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
         Appbar(
              title: appbarTitle(),
              subtitle: appbarSubtitle(),
              leftAction: Padding(
                padding: EdgeInsets.only(right: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                    2 *
                    .02),
                child: Tooltip(
                  message: AppLocalizations.of(context)
                      .translate("back"),
                  child: GestureDetector(
                    onTap: () {Navigator.pop(context);},
                    child: Icon(
                      Icons.arrow_back,
                      size: MediaQuery.of(context).size.width * .075,
                      color: Colors.black,
                    ),
                  ),
                ),),),
      ],),),
    );
  }
}