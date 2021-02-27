import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasamira/localization.dart';
import 'package:nasamira/pages/search.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: non_constant_identifier_names
int sol = 1000;
// ignore: non_constant_identifier_names
bool Curiositytimeformat = false;

String nameCuriosity = 'Curiosity';
String nickCuriosity = 'Curiosity';

String typeCuriosity = 'rover';

// ignore: non_constant_identifier_names
int launchCuriosity_y = 2011;
// ignore: non_constant_identifier_names
int launchCuriosity_m = 11;
// ignore: non_constant_identifier_names
int launchCuriosity_d = 26;

// ignore: non_constant_identifier_names
int arriveCuriosity_y = 2012;
// ignore: non_constant_identifier_names
int arriveCuriosity_m = 8;
// ignore: non_constant_identifier_names
int arriveCuriosity_d = 6;

// ignore: non_constant_identifier_names
int lcCuriosity_y = 0;
// ignore: non_constant_identifier_names
int lcCuriosity_m = 0;
// ignore: non_constant_identifier_names
int lcCuriosity_d = 0;

// ignore: non_constant_identifier_names
int endCuriosity_y = 0;
// ignore: non_constant_identifier_names
int endCuriosity_m = 0;
// ignore: non_constant_identifier_names
int endCuriosity_d = 0;

String getZero(input) {
  if (input < 10) {
    return '0' + input.toString();
  } else {
    return input.toString();
  }
}

DateTime arriveCuriosity = DateTime.parse(
    '${getZero(arriveCuriosity_y)}-${getZero(arriveCuriosity_m)}-${getZero(arriveCuriosity_d)}');
DateTime _dateCuriosity = DateTime.parse('2019-06-13');
DateTime maxCuriosity = DateTime.now();

String operatorCuriosity = 'NASA';
String manufacturerCuriosity = 'Boeing';

// ignore: camel_case_types
class askCuriosity extends StatefulWidget {
  const askCuriosity({Key key}) : super(key: key);

  @override
  _askCuriosity createState() => _askCuriosity();
}

// ignore: camel_case_types
class _askCuriosity extends State<askCuriosity> {
  @override
  Widget build(BuildContext context) {
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
        title: new Text(
          'Curiosity',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .07,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0),
        ),
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.width * .12,
        width: MediaQuery.of(context).size.width * .12,
        child: FittedBox(
          child: Tooltip(
            message: AppLocalizations.of(context).translate('tooltipHome'),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Icon(CupertinoIcons.clear_thick, color: Colors.deepOrange),
            ),
          ),
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
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .05,
                      left: MediaQuery.of(context).size.width * .1 +
                          (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .04),
                  child: new Text(
                    'CURIOSITY',
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
                              .02),
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
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Curiositytimeformat == false
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('timePicker'),
                                child: Switch(
                                  value: Curiositytimeformat,
                                  activeTrackColor: Colors.black38,
                                  inactiveTrackColor: Colors.black38,
                                  inactiveThumbColor: Colors.white,
                                  activeColor: Colors.white,
                                  onChanged: (bool value) {
                                    setState(() => Curiositytimeformat = value);
                                  },
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('roverImgSearchSol'),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    color: Curiositytimeformat == true
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * .03,
                            ),
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('roverImgSearchDateDotted'),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .05,
                                  color: Curiositytimeformat == false
                                      ? Colors.white
                                      : Colors.black38),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('month'),
                                child: Text(
                                  '${getZero(_dateCuriosity.month)}',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              .09,
                                      color: Curiositytimeformat == false
                                          ? Colors.white
                                          : Colors.black38,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                '/',
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        .09,
                                    color: Curiositytimeformat == false
                                        ? Colors.white
                                        : Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('day'),
                                child: Text(
                                  '${getZero(_dateCuriosity.day)}',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          .09,
                                      color: Curiositytimeformat == false
                                          ? Colors.white
                                          : Colors.black38,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                '/',
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        .09,
                                    color: Curiositytimeformat == false
                                        ? Colors.white
                                        : Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('year'),
                                child: Text(
                                  '${_dateCuriosity.year}',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          .09,
                                      color: Curiositytimeformat == false
                                          ? Colors.white
                                          : Colors.black38,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .03),
                            child: new Text(
                              AppLocalizations.of(context)
                                  .translate('roverImgSearchSolDotted'),
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .05,
                                  fontWeight: FontWeight.bold,
                                  color: Curiositytimeformat == true
                                      ? Colors.white
                                      : Colors.black38),
                            ),
                          ),
                          Text(
                            sol.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * .09,
                                color: Curiositytimeformat == true
                                    ? Colors.white
                                    : Colors.black38),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .02,
                                bottom: (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .02),
                            child: new Center(
                              child: Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('setDate'),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    if (Curiositytimeformat == false) {
                                      final action = SizedBox(
                                          height: 200,
                                          child: CupertinoDatePicker(
                                            initialDateTime: _dateCuriosity,
                                            mode: CupertinoDatePickerMode.date,
                                            backgroundColor: Colors.white,
                                            minimumDate: arriveCuriosity,
                                            maximumDate: maxCuriosity,
                                            onDateTimeChanged: (dateCuriosity) {
                                              setState(() {
                                                _dateCuriosity = dateCuriosity;
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
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01),
                                      child: Center(
                                        child: new Text(
                                          AppLocalizations.of(context)
                                              .translate(
                                                  'roverImgSearchSetTime'),
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
                    borderRadius: BorderRadius.all(Radius.circular(
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04))),
                width: MediaQuery.of(context).size.width * .8,
                child: GestureDetector(
                  onTap: () {
                    if (Curiositytimeformat == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchWindow(
                                url:
                                    'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=$sol&api_key=Auy5Y3JzRVdcidYPuytq5KI7Mxfqnm1IPdEQoeYz',
                                date: '$sol sol')),
                      );
                    } else if (Curiositytimeformat == false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchWindow(
                                url:
                                    'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=${_dateCuriosity.year}-${_dateCuriosity.month}-${_dateCuriosity.day}&api_key=Auy5Y3JzRVdcidYPuytq5KI7Mxfqnm1IPdEQoeYz',
                                date:
                                    '${getZero(_dateCuriosity.month)}/${getZero(_dateCuriosity.day)}/${_dateCuriosity.year}')),
                      );
                    }
                  },
                  child: Tooltip(
                    message:
                        AppLocalizations.of(context).translate('searchImage'),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .02,
                        bottom: MediaQuery.of(context).size.height * .02,
                      ),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('roverImgSearchButton'),
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .1,
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
