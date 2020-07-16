import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mira/localization.dart';

import 'package:numberpicker/numberpicker.dart';

// ignore: non_constant_identifier_names
int sol = 1000;
// ignore: non_constant_identifier_names
bool Spirittimeformat = false;

String typeSpirit = 'Rover';

// ignore: non_constant_identifier_names
int launchSpirit_y = 2003;
// ignore: non_constant_identifier_names
int launchSpirit_m = 6;
// ignore: non_constant_identifier_names
int launchSpirit_d = 10;

// ignore: non_constant_identifier_names
int arriveSpirit_y = 2004;
// ignore: non_constant_identifier_names
int arriveSpirit_m = 1;
// ignore: non_constant_identifier_names
int arriveSpirit_d = 4;

DateTime arriveSpirit = DateTime.parse('2004-01-04');
DateTime _dateSpirit = DateTime.parse('2004-04-05');
DateTime maxSpirit = DateTime.parse('2010-03-22');

// ignore: non_constant_identifier_names
int endSpirit_y = 2010;
// ignore: non_constant_identifier_names
int endSpirit_m = 3;
// ignore: non_constant_identifier_names
int endSpirit_d = 22;

// ignore: non_constant_identifier_names
String launchSpirit_ry = '2003';
// ignore: non_constant_identifier_names
String launchSpirit_rm = '06';
// ignore: non_constant_identifier_names
String launchSpirit_rd = '10';

// ignore: non_constant_identifier_names
String arriveSpirit_ry = '2004';
// ignore: non_constant_identifier_names
String arriveSpirit_rm = '01';
// ignore: non_constant_identifier_names
String arriveSpirit_rd = '04';

// ignore: non_constant_identifier_names
String endSpirit_ry = '2010';
// ignore: non_constant_identifier_names
String endSpirit_rm = '03';
// ignore: non_constant_identifier_names
String endSpirit_rd = '22';

String operatorSpirit = 'NASA';
String manufacturerSpirit = 'JPL';

// ignore: camel_case_types
class setSpirit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'MER-A Spirit',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .07, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2.0),
        ),
        backgroundColor: Color(0xffe66909),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Tooltip(
          message: 'Home',
          child: Icon(Icons.chevron_left, color: Colors.deepOrange),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: new SafeArea(
          child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2 * .04 + MediaQuery.of(context).size.width * .1),
                  child: new Text(
                    'SPIRIT',
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
                      right: MediaQuery.of(context).size.width * .1
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/background.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: new BorderRadius.all(
                          Radius.circular((MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2 * .04),
                        ),),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .1, right: MediaQuery.of(context).size.width * .1, top: MediaQuery.of(context).size.width * .07, bottom: MediaQuery.of(context).size.width * .07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                              Text(
                                typeSpirit,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:  MediaQuery.of(context).size.width * .12,
                                  color: Colors.white,
                                ),
                              ),
                          Row(
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate('roverSpecLaunch'),
                                style: TextStyle(
                                  fontSize:  MediaQuery.of(context).size.width * .05,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                launchSpirit_rm +
                                    '/' +
                                    launchSpirit_rd +
                                    '/' +
                                    launchSpirit_ry,
                                style: TextStyle(
                                  fontSize:  MediaQuery.of(context).size.width * .05,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate('roverSpecArrive'),
                                style: TextStyle(
                                  fontSize:  MediaQuery.of(context).size.width * .05,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                arriveSpirit_rm +
                                    '/' +
                                    arriveSpirit_rd +
                                    '/' +
                                    arriveSpirit_ry,
                                style: TextStyle(
                                  fontSize:  MediaQuery.of(context).size.width * .05,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate('roverSpecEnd'),
                                style: TextStyle(
                                  fontSize:  MediaQuery.of(context).size.width * .05,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                endSpirit_rm +
                                    '/' +
                                    endSpirit_rm +
                                    '/' +
                                    endSpirit_ry,
                                style: TextStyle(
                                  fontSize:  MediaQuery.of(context).size.width * .05,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
                            child: new Text(
                              AppLocalizations.of(context)
                                  .translate('roverSpecOperator'),
                              style: TextStyle(
                                fontSize:  MediaQuery.of(context).size.width * .05,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            operatorSpirit,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:  MediaQuery.of(context).size.width * .1,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)
                                .translate('roverSpecManufacturer'),
                            style: TextStyle(
                              fontSize:  MediaQuery.of(context).size.width * .05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            manufacturerSpirit,
                            style: TextStyle(
                              fontSize:  MediaQuery.of(context).size.width * .1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
                            child: new Center(
                              child: Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('specButton'),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => askSpirit(),
                                      ),
                                    );
                                  },
                                  color: Colors.white,
                                  child: Container(width:  MediaQuery.of(context).size.width * .6, child: Center(child: Text(
                                    AppLocalizations.of(context)
                                        .translate('roverSpecButton'),
                                    style: TextStyle(
                                      letterSpacing: 7,
                                      fontSize:  MediaQuery.of(context).size.width * .05,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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

// ignore: camel_case_types
class askSpirit extends StatefulWidget {
  const askSpirit({Key key}) : super(key: key);

  @override
  _askSpirit createState() => _askSpirit();
}

// ignore: camel_case_types
class _askSpirit extends State<askSpirit> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Spirit',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 2.0),
        ),
        backgroundColor: Color(0xffe66909),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Tooltip(
          message: 'Home',
          child: Icon(Icons.chevron_left, color: Color(0xffe66909)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: new SafeArea(
          child: new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 35, bottom: 15),
                  child: new Text(
                    'SPIRIT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xffe66909),
                    ),
                  ),
                ),
                new Center(
                  child: new Container(
                    decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/background.jpg'),
                          fit: BoxFit.fitHeight,
                        ),
                        borderRadius:
                            new BorderRadius.all(Radius.circular(25))),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate('roverImgSearchDate'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Spirittimeformat == false
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('timePicker'),
                                child: Switch(
                                  value: Spirittimeformat,
                                  activeTrackColor: Colors.black38,
                                  inactiveTrackColor: Colors.black38,
                                  inactiveThumbColor: Colors.white,
                                  activeColor: Colors.white,
                                  onChanged: (bool value) {
                                    setState(() => Spirittimeformat = value);
                                  },
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('roverImgSearchSol'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Spirittimeformat == true
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                            ],
                          ),
                          Text(
                            AppLocalizations.of(context)
                                .translate('roverImgSearchDateDotted'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Spirittimeformat == false
                                    ? Colors.white
                                    : Colors.black38),
                          ),
                          Text(
                            '${_dateSpirit.month}/${_dateSpirit.day}/${_dateSpirit.year}',
                            style: TextStyle(
                                fontSize: 30,
                                color: Spirittimeformat == false
                                    ? Colors.white
                                    : Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: new Text(
                              AppLocalizations.of(context)
                                  .translate('roverImgSearchSolDotted'),
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Spirittimeformat == true
                                      ? Colors.white
                                      : Colors.black38),
                            ),
                          ),
                          Text(
                            sol.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Spirittimeformat == true
                                    ? Colors.white
                                    : Colors.black38),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: new Center(
                              child: Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('setDate'),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    if (Spirittimeformat == false) {
                                      final action = SizedBox(
                                          height: 200,
                                          child: CupertinoDatePicker(
                                            initialDateTime: _dateSpirit,
                                            mode: CupertinoDatePickerMode.date,
                                            backgroundColor: Colors.white,
                                            minimumDate: arriveSpirit,
                                            maximumDate: maxSpirit,
                                            onDateTimeChanged: (dateSpirit) {
                                              setState(() {
                                                _dateSpirit = dateSpirit;
                                              });
                                            },
                                          ));
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) => action);
                                    } else {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (context) => Container(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: NumberPicker.integer(initialValue: sol, minValue: 1, maxValue: 100000, onChanged: (val){setState((){sol = val;});})
                                        ),
                                      );
                                    }
                                  },
                                  color: Colors.white,
                                  child: new Text(
                                    AppLocalizations.of(context)
                                        .translate('roverImgSearchSetTime'),
                                    style: TextStyle(
                                      letterSpacing: 10,
                                      fontSize: 15,
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Tooltip(
                              message: AppLocalizations.of(context)
                                  .translate('searchImage'),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25),
                                ),
                                onPressed: () {
                                  if (Spirittimeformat == false) {
                                    var link =
                                        'https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?earth_date=${_dateSpirit.year}-${_dateSpirit.month}-${_dateSpirit.day}&api_key=Auy5Y3JzRVdcidYPuytq5KI7Mxfqnm1IPdEQoeYz';
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          //builder: (context) =>
                                          ),
                                    );
                                  } else {
                                    var link =
                                        'https://api.nasa.gov/mars-photos/api/v1/rovers/spirit/photos?sol=1000&api_key=Auy5Y3JzRVdcidYPuytq5KI7Mxfqnm1IPdEQoeYz';
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          //builder: (context) =>
                                          ),
                                    );
                                  }
                                },
                                color: Colors.white,
                                child: new Text(
                                  AppLocalizations.of(context)
                                      .translate('roverImgSearchButton'),
                                  style: TextStyle(
                                    letterSpacing: 15.0,
                                    fontSize: 15,
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
