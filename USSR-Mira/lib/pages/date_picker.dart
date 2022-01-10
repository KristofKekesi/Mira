// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:numberpicker/numberpicker.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

// widgets
import "../widgets/collection.dart";
import "../widgets/content_box.dart";
import "../widgets/appbar.dart";
import "../widgets/button.dart";

// pages
import "image_search.dart";

// utils
import "../utils/localization.dart";
import "../utils/extensions.dart";
import "../utils/get_th.dart";
import "../utils/update.dart";
import "../pass.dart";

/// The date picker page used in the image search page.
class DatePickerPage extends StatefulWidget {
  /// Constructor
  const DatePickerPage({
    required this.dataSector,
    Key? key,
  }) : super(key: key);

  /// Don't know what this is.
  final int dataSector;

  @override
  DatePickerPageState createState() => DatePickerPageState();
}

/// The stateful part of [DatePickerPage].
class DatePickerPageState extends State<DatePickerPage> {
  /// [bool]ean data for specifying the date format.
  /// If true it's date, if false it's SOL.
  bool timeFormat = false;

  /// The minimum value that is selectable.
  late DateTime minDate;

  /// The current date.
  late DateTime date;

  /// The maximum value that is selectable.
  late DateTime maxDate;

  /// The default value of date.
  late Map<String, dynamic> defaultDatePosition;

  /// The default value of SOL.
  late int defaultSolPosition;

  /// The maximum value that is selectable.
  late int maxSol;

  /// Map that contains the date of arrival
  late Map<String, dynamic> arrive;

  /// Map that contains the date of arrival
  late Map<String, dynamic> maxDateRaw;

  /// The name of the rover
  late String name;

  /// The vehicles' API's URL.
  late String url;

  @override
  void initState() {
    Map<String, dynamic> source;
    if (updated == true) {
      source = local[widget.dataSector];
    } else {
      source = hardCodeData[widget.dataSector];
    }

    arrive = source["arrive"];
    defaultDatePosition = source["default-date"];
    defaultSolPosition = source["default-sol"];
    maxDateRaw = source["last-date"];
    maxSol = source["last-sol"] ?? 10000;

    name = source["name"];
    url = source["url"];

    minDate = DateTime.utc(arrive["year"], arrive["month"], arrive["day"]);
    date = DateTime.utc(
      defaultDatePosition["year"],
      defaultDatePosition["month"],
      defaultDatePosition["day"],
    );
    if (maxDateRaw["year"] == null) {
      maxDate = DateTime.now();
    } else {
      maxDate = DateTime.utc(
        maxDateRaw["year"],
        maxDateRaw["month"],
        maxDateRaw["day"],
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _changeValue(bool value) {
      setState(() => timeFormat = value);
    }

    Widget invalidDateContainer() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .05,
                left: MediaQuery.of(context).size.width * .05 +
                    (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .04,
              ),
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
                    image: AssetImage(appBackground),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04,
                    ),
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
                        .04,
                  ),
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );

    Widget datePickerContainer() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ContentBox(
              title: name,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02,
                  ),
                  child: Button(
                    valueTextStyle: TextStyle(
                      color:
                          timeFormat == false ? Colors.white : Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                    valueFontSize: MediaQuery.of(context).size.width * .08,
                    titleTextStyle: TextStyle(
                      color:
                          timeFormat == false ? Colors.white : Colors.black38,
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
                              AppLocalizations.of(context).translate("month"),
                          child: AutoSizeText(
                            spacerZeros(date.month),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .08,
                              color: timeFormat == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AutoSizeText(
                          "/",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .08,
                            color: timeFormat == false
                                ? Colors.white
                                : Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Tooltip(
                          message:
                              AppLocalizations.of(context).translate("day"),
                          child: AutoSizeText(
                            spacerZeros(date.day),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .08,
                              color: timeFormat == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        AutoSizeText(
                          "/",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .08,
                            color: timeFormat == false
                                ? Colors.white
                                : Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Tooltip(
                          message:
                              AppLocalizations.of(context).translate("year"),
                          child: AutoSizeText(
                            "${date.year}",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .08,
                              color: timeFormat == false
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    tooltip: AppLocalizations.of(context)
                        .translate("roverImgSearchSetDate"),
                    action: () {
                      final Widget actionWidget = SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          initialDateTime: date,
                          mode: CupertinoDatePickerMode.date,
                          backgroundColor: Colors.white,
                          minimumDate: minDate,
                          maximumDate: maxDate,
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() {
                              date = newDate;
                            });
                          },
                        ),
                      );
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => actionWidget,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02,
                  ),
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
                    value: defaultSolPosition.toString(),
                    action: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: NumberPicker(
                            value: defaultSolPosition,
                            minValue: 0,
                            maxValue: maxSol,
                            onChanged: (int val) {
                              setState(() {
                                defaultSolPosition = val;
                              });
                            },
                          ),
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
                        .02,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)
                            .translate("date")
                            .toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * .05,
                          color: timeFormat == false
                              ? Colors.white
                              : Colors.black38,
                        ),
                      ),
                      Tooltip(
                        message: AppLocalizations.of(context)
                            .translate("timePicker"),
                        child: Switch(
                          value: timeFormat,
                          activeTrackColor: Colors.black38,
                          inactiveTrackColor: Colors.black38,
                          inactiveThumbColor: Colors.white,
                          activeColor: Colors.white,
                          splashRadius: 0,
                          onChanged: _changeValue,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .translate("SOL")
                            .toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * .05,
                          color: timeFormat == true
                              ? Colors.white
                              : Colors.black38,
                        ),
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
                  tooltip:
                      AppLocalizations.of(context).translate("searchImage"),
                  action: () {
                    if (timeFormat == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => SearchWindow(
                            name: name,
                            url: "${url}photos?sol=$defaultSolPosition"
                                "&api_key=$apiKey",
                            time: "$defaultSolPosition"
                                "${getTh(context, defaultSolPosition)} sol",
                          ),
                        ),
                      );
                    } else if (timeFormat == false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => SearchWindow(
                            name: name,
                            url: "${url}photos?earth_date=${date.year}"
                                "-${date.month}-${date.day}&api_key=$apiKey",
                            time:
                                "${spacerZeros(date.month)}/${spacerZeros(date.day)}/${date.year}",
                          ),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        );

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
