import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:nasamira/datePicker.dart';

import '../localization.dart';

class RoverSpecPage extends StatelessWidget {
  final bool api_enabled;
  final String mission;
  final String nick;
  final String type;
  final String operator;
  final String manufacturer;

  final launch;
  final arrive;
  final connection_lost;
  final end;

  const RoverSpecPage({Key key, this.api_enabled, this.mission, this.nick, this.type, this.launch, this.arrive, this.connection_lost, this.end, this.operator, this.manufacturer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String launchY;
    String launchM;
    String launchD;

    String checkNull(int num) {
      if (num < 10) {
        return "0" + num.toString();
      } else {
        return num.toString();
      }
    }

    void getLaunchDate(){
      if (launch == null) {
        launchY = "──";
        launchM = "─";
        launchD = "─";
      } else {
        launchY = launch["year"];
        launchM = checkNull(int.parse(launch["month"]));
        launchD = checkNull(int.parse(launch["day"]));
      }
    }

    String arriveY;
    String arriveM;
    String arriveD;

    void getArriveDate(){
      if (arrive == null) {
        arriveY = "──";
        arriveM = "─";
        arriveD = "─";
      } else {
        arriveY = arrive["year"];
        arriveM = checkNull(int.parse(arrive["month"]));
        arriveD = checkNull(int.parse(arrive["day"]));
      }
    }

    String lcY;
    String lcM;
    String lcD;

    void getConnectionLostDate(){
      if (connection_lost == null) {
        lcY = "──";
        lcM = "─";
        lcD = "─";
      } else {
        lcY = connection_lost["year"];
        lcM = checkNull(int.parse(connection_lost["month"]));
        lcD = checkNull(int.parse(connection_lost["day"]));
      }
    }

    String endY;
    String endM;
    String endD;

    void getEndDate(){
      if (end == null) {
        endY = "──";
        endM = "─";
        endD = "─";
      } else {
        endY = end["year"];
        endM = end["month"];
        endD = end["day"];
        endM = checkNull(int.parse(end["month"]));
        endD = checkNull(int.parse(end["day"]));
      }
    }

    getLaunchDate();
    getArriveDate();
    getConnectionLostDate();
    getEndDate();

    String _headerText() {
      if (mission != null) {
        return mission + " " + nick;
      } else {
        return nick;
      }
    }

    Widget actionWidget;
    if (api_enabled  == true) {
      actionWidget = Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
        child: new Center(
          child: Tooltip(
            message: AppLocalizations.of(context).translate('specButton'),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DatePickerPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                width: MediaQuery.of(context).size.width * .8,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).translate('roverSpecButton'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .05,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      actionWidget = Container();
    }

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          //toolbarHeight: MediaQuery.of(context).size.height * .07,
          leading: Tooltip(
            message: AppLocalizations.of(context).translate('back'),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * .06,
              ),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: new AutoSizeText(
            _headerText(),
            minFontSize: 1,
            maxLines: 1,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .07,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: new SafeArea(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                            2 *
                            .04 +
                            MediaQuery.of(context).size.width * .1),
                    child: new Text(
                      nick,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .1,
                        right: MediaQuery.of(context).size.width * .1),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: new BorderRadius.all(
                          Radius.circular((MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                              2 *
                              .04),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                                2 *
                                .04,
                            right: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                                2 *
                                .04,
                            top: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                                2 *
                                .02,
                            bottom: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                                2 *
                                .04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).translate(type),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width * .12,
                                color: Colors.white,
                              ),
                            ),
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
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
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
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
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
                                          fontSize: MediaQuery.of(context)
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
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
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
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
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
                                          fontSize: MediaQuery.of(context)
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('roverSpecLastMin'),
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
                                        lcM,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('day'),
                                      child: Text(
                                        lcD,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('year'),
                                      child: Text(
                                        lcY,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
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
                                        endM,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
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
                                          fontSize: MediaQuery.of(context)
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
                                        MediaQuery.of(context).size.width *
                                            .05,
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
                                          fontSize: MediaQuery.of(context)
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
                              "* " +
                                  AppLocalizations.of(context)
                                      .translate('roverSpecLast'),
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .045,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              "** " +
                                  AppLocalizations.of(context)
                                      .translate('roverSpecEnd'),
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .045,
                                color: Colors.white70,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                  MediaQuery.of(context).size.height * .03),
                              child: new Text(
                                AppLocalizations.of(context)
                                    .translate('roverSpecOperator'),
                                style: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.width * .05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Text(
                              operator,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                MediaQuery.of(context).size.width * .1,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('roverSpecManufacturer'),
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .05,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              manufacturer,
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            actionWidget
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

}