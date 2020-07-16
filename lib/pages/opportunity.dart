import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mira/localization.dart';

import 'package:numberpicker/numberpicker.dart';

// ignore: non_constant_identifier_names
int sol = 1000;
// ignore: non_constant_identifier_names
bool Opportunitytimeformat = false;

String typeOpportunity = 'Rover';

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

// ignore: non_constant_identifier_names
int lcOpportunity_y = 2018;
// ignore: non_constant_identifier_names
int lcOpportunity_m = 6;
// ignore: non_constant_identifier_names
int lcOpportunity_d = 10;

// ignore: non_constant_identifier_names
int endOpportunity_y = 2019;
// ignore: non_constant_identifier_names
int endOpportunity_m = 2;
// ignore: non_constant_identifier_names
int endOpportunity_d = 13;

String getZero(input) {
  if(input < 10) {
    return '0' + input.toString();
  } else {
    return input.toString();
  }
}

DateTime arriveOpportunity = DateTime.parse('${getZero(arriveOpportunity_y)}-${getZero(arriveOpportunity_m)}-${arriveOpportunity_d}');
DateTime dateOpportunity = DateTime.parse('2017-03-13');
DateTime maxOpportunity = DateTime.parse('${getZero(lcOpportunity_y)}-${getZero(lcOpportunity_m)}-${lcOpportunity_d}');

String operatorOpportunity = 'NASA';
String manufacturerOpportunity = 'JPL';

// ignore: camel_case_types
class setOpportunity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          leading: Tooltip(message: AppLocalizations.of(context).translate('back'), child: GestureDetector(onTap: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back_ios, color: Colors.white,),),
          ), flexibleSpace: Container(
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
            'MER-B Opportunity',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * .07,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0),
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
                    padding: EdgeInsets.only(
                        left: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                            2 *
                            .04 +
                            MediaQuery.of(context).size.width * .1),
                    child: new Text(
                      'OPPORTUNITY',
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
                            left: MediaQuery.of(context).size.width * .1,
                            right: MediaQuery.of(context).size.width * .1,
                            top: MediaQuery.of(context).size.width * .07,
                            bottom: MediaQuery.of(context).size.width * .07),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              typeOpportunity,
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
                                Text(
                                  getZero(launchOpportunity_m) +
                                      '/' +
                                      getZero(launchOpportunity_d) +
                                      '/' +
                                      getZero(launchOpportunity_y),
                                  style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                  ),
                                )
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
                                ),
                                Text(
                                  getZero(arriveOpportunity_m) +
                                      '/' +
                                      getZero(arriveOpportunity_d) +
                                      '/' +
                                      getZero(arriveOpportunity_y),
                                  style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                  ),
                                )
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
                                Text(
                                  getZero(lcOpportunity_m) +
                                      '/' +
                                      getZero(lcOpportunity_d) +
                                      '/' +
                                      getZero(lcOpportunity_y),
                                  style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('roverSpecEnd'),
                                  style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  getZero(endOpportunity_m) +
                                      '/' +
                                      getZero(endOpportunity_d) +
                                      '/' +
                                      getZero(endOpportunity_y),
                                  style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "* " +
                                  AppLocalizations.of(context)
                                      .translate('roverSpecLast'),
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .05,
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
                              operatorOpportunity,
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
                              manufacturerOpportunity,
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * .1,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
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
                                          builder: (context) => askSpirit(),
                                        ),
                                      );
                                    },
                                    color: Colors.white,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .6,
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate('roverSpecButton'),
                                          style: TextStyle(
                                            letterSpacing: 7,
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
        leading: Tooltip(message: AppLocalizations.of(context).translate('back'), child: GestureDetector(onTap: (){Navigator.pop(context);}, child: Icon(Icons.arrow_back_ios, color: Colors.white,),),
        ), flexibleSpace: Container(
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
          'MER-A Spirit',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .07,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0),
        ),
      ),
      floatingActionButton: Tooltip(message: AppLocalizations.of(context).translate('tooltipHome'), child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Icon(CupertinoIcons.clear_thick, color: Colors.deepOrange),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: new SafeArea(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .05,left: MediaQuery.of(context).size.width * .1 + (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                      2 *
                      .04),
                  child: new Text(
                    'SPIRIT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .1,
                      color: Colors.black,
                    ),
                  ),
                ),
                new Center(
                  child: new Container(
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                      new BorderRadius.all(Radius.circular((MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                          2 *
                          .04),),),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1, right: MediaQuery.of(context).size.width * .1, top: MediaQuery.of(context).size.width * .05, bottom: MediaQuery.of(context).size.width * .05),
                      child: Column(
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
                                    fontSize: MediaQuery.of(context).size.width * .05,
                                    color: Opportunitytimeformat == false
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('timePicker'),
                                child: Switch(
                                  value: Opportunitytimeformat,
                                  activeTrackColor: Colors.black38,
                                  inactiveTrackColor: Colors.black38,
                                  inactiveThumbColor: Colors.white,
                                  activeColor: Colors.white,
                                  onChanged: (bool value) {
                                    setState(() => Opportunitytimeformat = value);
                                  },
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('roverImgSearchSol'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.width * .05,
                                    color: Opportunitytimeformat == true
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.width * .03,),
                            child:
                            Text(
                              AppLocalizations.of(context)
                                  .translate('roverImgSearchDateDotted'),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width * .05,
                                  color: Opportunitytimeformat == false
                                      ? Colors.white
                                      : Colors.black38),
                            ),
                          ),
                          Text(
                            '${dateOpportunity.month}/${dateOpportunity.day}/${dateOpportunity.year}',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * .1,
                                color: Opportunitytimeformat == false
                                    ? Colors.white
                                    : Colors.black38,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
                            child: new Text(
                              AppLocalizations.of(context)
                                  .translate('roverImgSearchSolDotted'),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * .05,
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
                                fontSize: MediaQuery.of(context).size.width * .1,
                                color: Opportunitytimeformat == true
                                    ? Colors.white
                                    : Colors.black38),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03,),
                            child: new Center(
                              child: Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('setDate'),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    if (Opportunitytimeformat == false) {
                                      final action = SizedBox(
                                          height: 200,
                                          child: CupertinoDatePicker(
                                            initialDateTime: dateOpportunity,
                                            mode: CupertinoDatePickerMode.date,
                                            backgroundColor: Colors.white,
                                            minimumDate: arriveOpportunity,
                                            maximumDate: maxOpportunity,
                                            onDateTimeChanged: (dateSpirit) {
                                              setState(() {
                                                dateSpirit = dateSpirit;
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: NumberPicker.integer(
                                                initialValue: sol,
                                                minValue: 1,
                                                maxValue: 100000,
                                                onChanged: (val) {
                                                  setState(() {
                                                    sol = val;
                                                  });
                                                })),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * .05,
                  bottom: MediaQuery.of(context).size.width * .1),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular((MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 2 * .04))),
                width: MediaQuery.of(context).size.width * .8,
                child: GestureDetector(
                  child: Tooltip(
                    message: AppLocalizations.of(context)
                        .translate('searchImage'),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .02,
                        bottom: MediaQuery.of(context).size.height * .02,
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).translate('roverImgSearchButton'),
                          style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width * .1,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
    );
  }
}
