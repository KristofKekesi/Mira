import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nasamira/localization.dart';

String getZero(input, length) {
  if (input == 0) {
    return '-' * length;
  } else if (input < 10) {
    return '0' + input.toString();
  } else {
    return input.toString();
  }
}

// ignore: camel_case_types
class basicRoverSpec extends StatelessWidget {
  final appbarContentSize;

  // ignore: non_constant_identifier_names
  final String full_name;
  // ignore: non_constant_identifier_names
  final String shrt_name;

  final String type;

  // ignore: non_constant_identifier_names
  final int launch_y;
  // ignore: non_constant_identifier_names
  final int launch_m;
  // ignore: non_constant_identifier_names
  final int launch_d;

  // ignore: non_constant_identifier_names
  final int arrive_y;
  // ignore: non_constant_identifier_names
  final int arrive_m;
  // ignore: non_constant_identifier_names
  final int arrive_d;

  // ignore: non_constant_identifier_names
  final int lc_y;
  // ignore: non_constant_identifier_names
  final int lc_m;
  // ignore: non_constant_identifier_names
  final int lc_d;

  // ignore: non_constant_identifier_names
  final int end_y;
  // ignore: non_constant_identifier_names
  final int end_m;
  // ignore: non_constant_identifier_names
  final int end_d;

  final String operator;
  final String manufacturer;

  final bool isAction;
  final action;

  // ignore: non_constant_identifier_names
  const basicRoverSpec({Key key, this.type, this.launch_y, this.launch_m, this.launch_d, this.arrive_y, this.arrive_m, this.arrive_d, this.lc_y, this.lc_m, this.lc_d, this.end_y, this.end_m, this.end_d, this.operator, this.manufacturer, this.action, this.full_name, this.shrt_name, this.appbarContentSize, this.isAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget actionWidget;
    if (isAction == true) {
      actionWidget = Padding(
        padding: EdgeInsets.only(
            top:
            MediaQuery.of(context).size.height * .03),
        child: new Center(
          child: Tooltip(
            message: AppLocalizations.of(context)
                .translate('specButton'),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius:
                new BorderRadius.circular(25),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => action,
                  ),
                );
              },
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width *
                    .8,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('roverSpecButton'),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context)
                          .size
                          .width *
                          .05,
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
            decoration:
            BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: new Text(
            full_name,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * appbarContentSize,
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
                      shrt_name,
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
                      child:  Padding(
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
                                .02),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('month'),
                                      child: Text(
                                        '${getZero(launch_m, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('day'),
                                      child: Text(
                                        '${getZero(launch_d, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('year'),
                                      child: Text(
                                        '${getZero(launch_y, 4)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),Row(
                                  children: <Widget>[
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('month'),
                                      child: Text(
                                        '${getZero(arrive_m, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('day'),
                                      child: Text(
                                        '${getZero(arrive_d, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('year'),
                                      child: Text(
                                        '${getZero(arrive_y, 4)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('month'),
                                      child: Text(
                                        '${getZero(lc_m, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('day'),
                                      child: Text(
                                        '${getZero(lc_d, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('year'),
                                      child: Text(
                                        '${getZero(lc_y, 4)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('month'),
                                      child: Text(
                                        '${getZero(end_m, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('day'),
                                      child: Text(
                                        '${getZero(end_d, 2)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '/',
                                      style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate('year'),
                                      child: Text(
                                        '${getZero(end_y, 4)}',
                                        style: TextStyle(
                                          fontSize:
                                          MediaQuery.of(context).size.width * .05,
                                          color: Colors.white,
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
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "** " +
                                  AppLocalizations.of(context)
                                      .translate('roverSpecEnd'),
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .045,
                                color: Colors.white,
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
                                  color: Colors.white,
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
                                color: Colors.white,
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