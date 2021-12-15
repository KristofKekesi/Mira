// @dart=2.9

// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:numberpicker/numberpicker.dart';

// widgets
import '../widgets/declarationalButton.dart';
import '../widgets/roverGrid.dart';
import '../widgets/content.dart';
import '../widgets/appbars.dart';

// pages
import 'searchImage.dart';

// utils
import '../utils/localization.dart';
import '../utils/update.dart';
import '../utils/getTh.dart';
import '../pass.dart';


class DatePickerPage extends StatefulWidget {
  final int dataSector;
  final String url;

  const DatePickerPage({
    Key key,
    this.dataSector,
    this.url,
  }) : super(key: key);

  @override
  _DatePickerPage createState() => _DatePickerPage(dataSector);
}

class _DatePickerPage extends State<DatePickerPage> {
  final int dataSector;

  _DatePickerPage(this.dataSector);

  String checkNull(int num) {
      return num < 10 ? "0" + num.toString() : num.toString();
  }

  DateTime minDate;
  DateTime date;
  DateTime maxDate;

  int sol;

  bool timeFormat = false;

  var arrive;
  var defaultDatePosition;
  int defaultSolPosition;
  var maxDateRaw;
  int maxSol;

  String mission;
  String name;
  String url;

  @override
  void initState() {
    //selecting source
    var source;
    if (updated == true) {
      source = localUpdate[dataSector];
    } else {
      source = hardCodeData[dataSector];
    }

    print(dataSector);

    arrive = source["arrive"];                    // todo get type
    defaultDatePosition = source["default-date"]; // todo get type
    defaultSolPosition = source["default-sol"];
    maxDateRaw = source["last-date"];             // todo get type
    maxSol = source["last-sol"] != null ? source["last-sol"] : 10000;

    mission = source["mission"];
    name = source["name"];
    url = source["url"];

    minDate = DateTime.utc(arrive["year"], arrive["month"], arrive["day"]);
    date = DateTime.utc(defaultDatePosition["year"],
        defaultDatePosition["month"], defaultDatePosition["day"]);
    if (maxDateRaw["year"] == null) {
      maxDate = DateTime.now();
    } else {
      maxDate = DateTime.utc(
          maxDateRaw["year"], maxDateRaw["month"], maxDateRaw["day"]);
    }
    sol = defaultSolPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _changeValue(value) {
      setState(() => timeFormat = value);
    }

    Widget invalidDateContainer() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .05,
                left: MediaQuery.of(context).size.width * .05 +
                    (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .04),
            child: AutoSizeText(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * .08,
                color: Colors.black,
              ),
              maxLines: 1,
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
              width: MediaQuery.of(context).size.width * .9,
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * .03,
                      ),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("invalidDateTitle"),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    AutoSizeText(
                      AppLocalizations.of(context)
                          .translate("invalidDateContent"),
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .05,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget datePickerContainer() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Content(
            title: name,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02),
                child: DeclarationalButton(
                  foreground: timeFormat == false
                ? Colors.white
                    : Colors.black38,
                  secondary: timeFormat == false
                      ? Colors.white
                      : Colors.black38,
                  // todo localize
                  title: "Date",
                  value: Row(
                    children: <Widget>[
                      Tooltip(
                        message:
                        AppLocalizations.of(context).translate('month'),
                        child: AutoSizeText(
                          '${checkNull(date.month)}',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width * .08,
                              color: timeFormat == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      AutoSizeText(
                        '/',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .08,
                            color: timeFormat == false
                                ? Colors.white
                                : Colors.black38,
                            fontWeight: FontWeight.bold),
                      ),
                      Tooltip(
                        message:
                        AppLocalizations.of(context).translate('day'),
                        child: AutoSizeText(
                          '${checkNull(date.day)}',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width * .08,
                              color: timeFormat == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      AutoSizeText(
                        '/',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .08,
                            color: timeFormat == false
                                ? Colors.white
                                : Colors.black38,
                            fontWeight: FontWeight.bold),
                      ),
                      Tooltip(
                        message:
                        AppLocalizations.of(context).translate('year'),
                        child: AutoSizeText(
                          '${date.year}',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width * .08,
                              color: timeFormat == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  tooltip: AppLocalizations.of(context).translate("roverImgSearchSetDate"),
                  action: (){final action = SizedBox(
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
                      builder: (context) => action);},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                        2 *
                        .02),
                child: DeclarationalButton(
                  foreground: timeFormat == true
                      ? Colors.white
                      : Colors.black38,
                  secondary: timeFormat == true
                      ? Colors.white
                      : Colors.black38,
                  // todo localize
                  title: "Sol",
                  tooltip: AppLocalizations.of(context).translate("roverImgSearchSetSOL"),
                  value: sol.toString(),
                  action: (){showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: NumberPicker(
                          value: sol,
                          minValue: 0,
                          maxValue: maxSol,
                          onChanged: (val) {
                            setState(() {
                              sol = val;
                            });
                          }),
                    ),
                  );},
                ),
              ),
      Padding(
      padding: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width +
      MediaQuery.of(context).size.height) /
      2 *
      .02,
      bottom: (MediaQuery.of(context).size.width +
      MediaQuery.of(context).size.height) /
      2 *
      .02),
      child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)
                        .translate('roverImgSearchDate'),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .05,
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
                        fontSize: MediaQuery.of(context).size.width * .05,
                        color: timeFormat == true
                            ? Colors.white
                            : Colors.black38),
                  ),
                ],
              ),),
              DeclarationalButton(background: Colors.white,
                foreground: Colors.black,
                // todo localize
                secondary: Colors.black54, title: "Search for", value: "Images",
              tooltip: AppLocalizations.of(context)
          .translate('searchImage'),
              action: (){if (timeFormat == true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchWindow(
                        name: name,
                          url: '${url}photos?sol=$sol&api_key=$apiKey',
                          date: '$sol${getTh(context, sol)} sol')),
                );
              } else if (timeFormat == false) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchWindow(
                          name: name,
                          url:
                          '${url}photos?earth_date=${date.year}-${date.month}-${date.day}&api_key=$apiKey',
                          date:
                          '${checkNull(date.month)}/${checkNull(date.day)}/${date.year}')),
                );
              }},)
            ],
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Opacity(
                opacity: 0,
                child: Appbar(
                  title: name,
                  leftAction: Padding(
                    padding: EdgeInsets.only(
                        right: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .02),
                    child: Tooltip(
                      message: AppLocalizations.of(context).translate("back"),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: MediaQuery.of(context).size.width * .075,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: maxDateRaw["year"] == null &&
                      minDate.compareTo(maxDate) > 0 ?
                      invalidDateContainer() :
                      datePickerContainer(),
              ),
            ],
          ),
          Appbar(
            title: name,
            leftAction: Padding(
              padding: EdgeInsets.only(
                  right: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .02),
              child: Tooltip(
                message: AppLocalizations.of(context).translate("back"),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: MediaQuery.of(context).size.width * .075,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
