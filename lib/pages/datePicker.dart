import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasamira/pages/search.dart';
import 'package:nasamira/widgets/localization.dart';
import 'package:numberpicker/numberpicker.dart';

import '../pass.dart';

class DatePickerPage extends StatefulWidget {
  final String url;
  final arrive;
  final connectionLost;
  final defaultPosition;
  final String mission;
  final String nick;

  const DatePickerPage({Key key, this.arrive, this.connectionLost, this.defaultPosition, this.mission, this.nick, this.url, }) : super(key: key);

  @override
  _DatePickerPage createState() => _DatePickerPage(url, arrive, connectionLost, defaultPosition, mission, nick);
}

// ignore: camel_case_types
class _DatePickerPage extends State<DatePickerPage> {
  final String url;
  final arrive;
  final connectionLost;
  final defaultPosition;
  final String mission;
  final String nick;

  _DatePickerPage(this.url, this.arrive, this.connectionLost, this.defaultPosition, this.mission, this.nick);

  String checkNull(int num) {
    if (num < 10) {
      return "0" + num.toString();
    } else {
      return num.toString();
    }
  }

  bool timeFormat;
  DateTime minDate;
  DateTime date;
  DateTime maxDate;
  int sol;

  @override
  void initState() {
    timeFormat = false;

    minDate = DateTime.utc(
        arrive["year"], arrive["month"], arrive["day"]);
    date = DateTime.utc(
        defaultPosition["year"], defaultPosition["month"],
        defaultPosition["day"]);
    if (connectionLost == null) {
      maxDate = DateTime.now();
    } else {
      maxDate = DateTime.utc(
          connectionLost["year"], connectionLost["month"],
          connectionLost["day"]);
    }
    sol = 1000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _changeValue(value) {
      setState(
              () => timeFormat = value);
    }

    String _headerText() {
      if (mission != null) {
        return mission + " " + nick;
      } else {
        return nick;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        title: AutoSizeText(
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
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.width * .12,
        width: MediaQuery.of(context).size.width * .12,
        child: FittedBox(child: Tooltip(
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
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
                  child: Text(
                    nick,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .1,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
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
                                    color: timeFormat == false
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('timePicker'),
                                child: Switch(
                                  value: timeFormat,
                                  activeTrackColor: Colors.black38,
                                  inactiveTrackColor: Colors.black38,
                                  inactiveThumbColor: Colors.white,
                                  activeColor: Colors.white,
                                  splashRadius: 0,
                                  onChanged: (bool value) {
                                    _changeValue(value);
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
                                    color: timeFormat == true
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
                                  color: timeFormat == false
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
                                  '${checkNull(date.month)}',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          .09,
                                      color: timeFormat == false
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
                                    color: timeFormat == false
                                        ? Colors.white
                                        : Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('day'),
                                child: Text(
                                  '${checkNull(date.day)}',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          .09,
                                      color: timeFormat == false
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
                                    color: timeFormat == false
                                        ? Colors.white
                                        : Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('year'),
                                child: Text(
                                  '${date.year}',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          .09,
                                      color: timeFormat == false
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
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('roverImgSearchSolDotted'),
                              style: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.width * .05,
                                  fontWeight: FontWeight.bold,
                                  color: timeFormat == true
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
                                color: timeFormat == true
                                    ? Colors.white
                                    : Colors.black38),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .03,
                            ),
                            child: Center(
                              child: Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate('setDate'),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    if (timeFormat == false) {
                                      final action = SizedBox(
                                          height: 200,
                                          child: CupertinoDatePicker(
                                            initialDateTime: date,
                                            mode: CupertinoDatePickerMode.date,
                                            backgroundColor: Colors.white,
                                            minimumDate: minDate,
                                            maximumDate: maxDate,
                                            onDateTimeChanged: (newDate) {
                                              setState(() {
                                                date = newDate;
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
                                          top: MediaQuery.of(context).size.height * .01,
                                          bottom: MediaQuery.of(context).size.height * .01),
                                      child: Center(child: Text(
                                        AppLocalizations.of(context)
                                            .translate('roverImgSearchSetTime'),
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
                    if (timeFormat == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchWindow(
                                    url: '$url?sol=$sol&api_key=$apiKey',
                                    date: '$sol sol')
                        ),
                      );
                    } else if (timeFormat == false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchWindow(
                                    url: '$url?earth_date=${date
                                        .year}-${date
                                        .month}-${date
                                        .day}&api_key=$apiKey',
                                    date: '${checkNull(
                                        date.month)}/${checkNull(
                                        date
                                            .day)}/${date.year}')
                        ),
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