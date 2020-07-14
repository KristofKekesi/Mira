import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mira/localization.dart';

import 'package:mira/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: non_constant_identifier_names
int sol = 1000;
bool Opportunitytimeformat = false;

String typeOpportunity = 'Rover';
String countryOpportunity = 'USA';

// ignore: non_constant_identifier_names
int launchOpportunity_y = 2003;
// ignore: non_constant_identifier_names
int launchOpportunity_m = 7;
// ignore: non_constant_identifier_names
int launchOpportunity_d = 7;

// ignore: non_constant_identifier_names
int arriveOpportunity_y = 2004;
// ignore: non_constant_identifier_names
int arriveOpportunity_m = 1;
// ignore: non_constant_identifier_names
int arriveOpportunity_d = 25;

DateTime arriveOpportunity = DateTime.parse('2014-07-07');
DateTime _dateOpportunity = DateTime.parse('2017-03-13');
DateTime maxOpportunity = DateTime.parse('2018-01-13');

// ignore: non_constant_identifier_names
int endOpportunity_y = 2018;
// ignore: non_constant_identifier_names
int endOpportunity_m = 1;
// ignore: non_constant_identifier_names
int endOpportunity_d = 13;

// ignore: non_constant_identifier_names
String launchOpportunity_ry = '2003';
// ignore: non_constant_identifier_names
String launchOpportunity_rm = '07';
// ignore: non_constant_identifier_names
String launchOpportunity_rd = '07';

// ignore: non_constant_identifier_names
String arriveOpportunity_ry = '2004';
// ignore: non_constant_identifier_names
String arriveOpportunity_rm = '01';
// ignore: non_constant_identifier_names
String arriveOpportunity_rd = '25';

// ignore: non_constant_identifier_names
String endOpportunity_ry = '2018';
// ignore: non_constant_identifier_names
String endOpportunity_rm = '01';
// ignore: non_constant_identifier_names
String endOpportunity_rd = '13';

String operatorOpportunity = 'NASA';
String manufacturerOpportunity = 'JPL';

// ignore: camel_case_types
class setOpportunity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Opportunity',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 2.0),
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
            'MER-B OPORTUNITY',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
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
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  topRight: const Radius.circular(25),
                  bottomLeft: const Radius.circular(25),
                  bottomRight: const Radius.circular(25),
                )),
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 30, right: 30, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Row(
              children: <Widget>[
                Text(
                typeOpportunity + ' ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              Text(
                countryOpportunity,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate(
                      'roverSpecLaunch'),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  launchOpportunity_rm +
                      '/' +
                      launchOpportunity_rd +
                      '/' +
                      launchOpportunity_ry,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate(
                      'roverSpecArrive'),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  arriveOpportunity_rm + '/' +
                      arriveOpportunity_rd + '/' +
                      arriveOpportunity_ry,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).translate(
                      'roverSpecEnd'),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  endOpportunity_rm + '/' +
                      endOpportunity_rd + '/' +
                      endOpportunity_ry,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: new Text(
                AppLocalizations.of(context).translate(
                    'roverSpecOperator'),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              operatorOpportunity,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              AppLocalizations.of(context).translate(
                  'roverSpecManufacturer'),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              manufacturerOpportunity,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: new Center(
                child: Tooltip(
                  message: AppLocalizations.of(context).translate('specButton'),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(
                          25),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              askOpportunity(),
                        ),
                      );
                    },
                    color: Colors.white,
                    child: new Text(
                      AppLocalizations.of(context).translate(
                          'roverSpecButton'),
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
            ),
              ],
            ),
          ),
        ),
      ),
      ],
    )],
    )
    ,
    )
    )
    ,
    );
  }
}

// ignore: camel_case_types
class askOpportunity extends StatefulWidget {
  const askOpportunity({Key key}) : super(key: key);

  @override
  _askOpportunity createState() => _askOpportunity();
}

// ignore: camel_case_types
class _askOpportunity extends State<askOpportunity> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Opportunity',
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
                        'MER-B OPPORTUNITY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
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
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(25),
                              topRight: const Radius.circular(25),
                              bottomLeft: const Radius.circular(25),
                              bottomRight: const Radius.circular(25),
                            )),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
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
                                    AppLocalizations.of(context).translate(
                                        'roverImgSearchDate'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Opportunitytimeformat == false
                                            ? Colors.white
                                            : Colors.black38),
                                  ),
                                  Tooltip(
                                    message: AppLocalizations.of(context).translate('timePicker'),
                                    child: Switch(
                                      value: Opportunitytimeformat,
                                      activeTrackColor: Colors.black38,
                                      inactiveTrackColor: Colors.black38,
                                      inactiveThumbColor: Colors.white,
                                      activeColor: Colors.white,
                                      onChanged: (bool value) {
                                        setState(() =>
                                        Opportunitytimeformat = value);
                                      },
                                    ),
                                  ),
                                  Text(
                                    AppLocalizations.of(context).translate(
                                        'roverImgSearchSol'),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Opportunitytimeformat == true
                                            ? Colors.white
                                            : Colors.black38),
                                  ),
                                ],
                              ),
                              Text(
                                  AppLocalizations.of(context).translate(
                                      'roverImgSearchDateDotted'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Opportunitytimeformat == false
                                          ? Colors.white
                                          : Colors.black38)
                              ),
                              Text(
                                '${_dateOpportunity.month}/${_dateOpportunity
                                    .day}/${_dateOpportunity.year}',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Opportunitytimeformat == false
                                        ? Colors.white
                                        : Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: new Text(
                                  AppLocalizations.of(context).translate(
                                      'roverImgSearchSolDotted'),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Opportunitytimeformat == true
                                          ? Colors.white
                                          : Colors.black38),
                                ),
                              ),
                              Text(
                                sol.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Opportunitytimeformat == true
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: new Center(
                                  child: Tooltip(
                                    message: AppLocalizations.of(context).translate('setDate'),
                                    child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          25),
                                    ),
                                    onPressed: () {
                                      if (Opportunitytimeformat == false) {
                                        final action = SizedBox(
                                            height: 200,
                                            child: CupertinoDatePicker(
                                              initialDateTime: _dateOpportunity,
                                              mode: CupertinoDatePickerMode
                                                  .date,
                                              backgroundColor: Colors.white,
                                              minimumDate: arriveOpportunity,
                                              maximumDate: maxOpportunity,
                                              onDateTimeChanged: (
                                                  dateOpportunity) {
                                                print(_dateOpportunity);
                                                setState(() {
                                                  _dateOpportunity =
                                                      dateOpportunity;
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
                                      AppLocalizations.of(context).translate(
                                          'roverImgSearchSetTime'),
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
                                  message: AppLocalizations.of(context).translate('searchImage'),
                                  child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    if (Opportunitytimeformat == false) {
                                      var link = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=${_dateOpportunity
                                          .year}-${_dateOpportunity
                                          .month}-${_dateOpportunity
                                          .day}&api_key=Auy5Y3JzRVdcidYPuytq5KI7Mxfqnm1IPdEQoeYz';
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          //builder: (context) =>
                                        ),
                                      );
                                    } else {
                                      var link = 'https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?sol=1000&api_key=Auy5Y3JzRVdcidYPuytq5KI7Mxfqnm1IPdEQoeYz';
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
                                    AppLocalizations.of(context).translate(
                                        'roverImgSearchButton'),
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
