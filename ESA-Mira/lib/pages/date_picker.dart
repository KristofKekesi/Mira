// Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:numberpicker/numberpicker.dart';

// widgets
import '../widgets/button.dart';
import '../widgets/collection.dart';
import '../widgets/content_box.dart';
import '../widgets/appbar.dart';

// pages
import 'image_search.dart';

// utils
import '../utils/localization.dart';
import '../utils/update.dart';
import '../utils/extensions.dart';
import '../utils/get_th.dart';
import '../pass.dart';

class DatePickerPage extends StatefulWidget {
  final int dataSector;

  const DatePickerPage({
    Key? key,
    required this.dataSector,
  }) : super(key: key);

  @override
  _DatePickerPage createState() => _DatePickerPage();
}

class _DatePickerPage extends State<DatePickerPage> {
  late DateTime minDate;
  late DateTime date;
  late DateTime maxDate;

  late int sol;

  bool timeFormat = false;

  late Map<String, dynamic> arrive;
  late Map<String, dynamic> defaultDatePosition;
  late int defaultSolPosition;
  late Map<String, dynamic> maxDateRaw;
  late int maxSol;

  late String mission;
  late String name;
  late String url;

  @override
  void initState() {
    //selecting source
    Map<String, dynamic> source;
    if (updated == true) {
      source = localUpdate[widget.dataSector];
    } else {
      source = hardCodeData[widget.dataSector];
    }

    arrive = source["arrive"];
    defaultDatePosition = source["default-date"];
    int defaultSolPosition = source["default-sol"];
    maxDateRaw = source["last-date"];
    maxSol = source["last-sol"] ?? 10000;

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
                image: const DecorationImage(
                  image: AssetImage('lib/images/esa-background.jpg'),
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
          ContentBox(
            title: name,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02),
                child: Button(
                  valueTextStyle: TextStyle(
                    color: timeFormat == false ? Colors.white : Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  valueFontSize: MediaQuery.of(context).size.width * .08,
                  titleTextStyle: TextStyle(
                    color: timeFormat == false ? Colors.white : Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  titleFontSize: MediaQuery.of(context).size.width * .05,
                  title: AppLocalizations.of(context)
                      .translate("date")
                      .capitalize(),
                  value: Row(
                    children: <Widget>[
                      Tooltip(
                        message:
                            AppLocalizations.of(context).translate('month'),
                        child: AutoSizeText(
                          spacerZeros(date.month),
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .08,
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
                        message: AppLocalizations.of(context).translate('day'),
                        child: AutoSizeText(
                          spacerZeros(date.day),
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .08,
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
                        message: AppLocalizations.of(context).translate('year'),
                        child: AutoSizeText(
                          '${date.year}',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .08,
                              color: timeFormat == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  tooltip: AppLocalizations.of(context)
                      .translate("roverImgSearchSetDate"),
                  action: () {
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
                        context: context, builder: (context) => action);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02),
                child: Button(
                  valueTextStyle: TextStyle(
                    color: timeFormat == true ? Colors.white : Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  valueFontSize: MediaQuery.of(context).size.width * .08,
                  titleTextStyle: TextStyle(
                    color: timeFormat == true ? Colors.white : Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  titleFontSize: MediaQuery.of(context).size.width * .05,
                  title: AppLocalizations.of(context).translate("SOL"),
                  tooltip: AppLocalizations.of(context)
                      .translate("roverImgSearchSetSOL"),
                  value: sol.toString(),
                  action: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
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
                    );
                  },
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
                          .translate('date')
                          .toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * .05,
                          color: timeFormat == false
                              ? Colors.white
                              : Colors.black38),
                    ),
                    Tooltip(
                      message:
                          AppLocalizations.of(context).translate('timePicker'),
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
                          .translate('SOL')
                          .toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * .05,
                          color: timeFormat == true
                              ? Colors.white
                              : Colors.black38),
                    ),
                  ],
                ),
              ),
              Button(
                background: Colors.white,
                valueTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                valueFontSize: MediaQuery.of(context).size.width * .08,
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                titleFontSize: MediaQuery.of(context).size.width * .05,
                value: AppLocalizations.of(context).translate("search"),
                tooltip: AppLocalizations.of(context).translate('searchImage'),
                action: () {
                  if (timeFormat == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchWindow(
                              name: name,
                              url: '${url}photos?sol=$sol&api_key=$apiKey',
                              time: '$sol${getTh(context, sol)} sol')),
                    );
                  } else if (timeFormat == false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchWindow(
                              name: name,
                              url:
                                  '${url}photos?earth_date=${date.year}-${date.month}-${date.day}&api_key=$apiKey',
                              time:
                                  '${spacerZeros(date.month)}/${spacerZeros(date.day)}/${date.year}')),
                    );
                  }
                },
              )
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
                  leftAction: const AppBarAction(
                    icon: Icons.arrow_back_rounded,
                  ),
                ),
              ),
              Container(
                child:
                    maxDateRaw["year"] == null && minDate.compareTo(maxDate) > 0
                        ? invalidDateContainer()
                        : datePickerContainer(),
              ),
            ],
          ),
          Appbar(
            title: name,
            leftAction: AppBarAction(
              icon: Icons.arrow_back_rounded,
              tooltip: AppLocalizations.of(context).translate("back"),
              action: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
