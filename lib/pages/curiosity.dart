import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nasamira/widgets.dart';

import 'dart:async';

// ignore: non_constant_identifier_names
bool Curiositytimeformat = false;

String typeCuriosity = 'Rover';
String countryCuriosity = 'USA';

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

DateTime arriveCuriosity = DateTime.parse('2012-08-06');
DateTime _dateCuriosity = DateTime.parse('2019-06-13');
DateTime maxCuriosity = DateTime.now();

// ignore: non_constant_identifier_names
int endCuriosity_y = 0;
// ignore: non_constant_identifier_names
int endCuriosity_m = 0;
// ignore: non_constant_identifier_names
int endCuriosity_d = 0;

// ignore: non_constant_identifier_names
String launchCuriosity_ry = '2011';
// ignore: non_constant_identifier_names
String launchCuriosity_rm = '11';
// ignore: non_constant_identifier_names
String launchCuriosity_rd = '26';

// ignore: non_constant_identifier_names
String arriveCuriosity_ry = '2012';
// ignore: non_constant_identifier_names
String arriveCuriosity_rm = '08';
// ignore: non_constant_identifier_names
String arriveCuriosity_rd = '06';

// ignore: non_constant_identifier_names
String endCuriosity_ry = '----';
// ignore: non_constant_identifier_names
String endCuriosity_rm = '--';
// ignore: non_constant_identifier_names
String endCuriosity_rd = '--';

String operatorCuriosity = 'NASA';
String manufacturerCuriosity = 'Boeing';

// ignore: camel_case_types
class setCuriosity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Curiosity',
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
                        'CURIOSITY',
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
                                    typeCuriosity + ' ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    countryCuriosity,
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
                                    'Launch: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    launchCuriosity_rm +
                                        '/' +
                                        launchCuriosity_rd +
                                        '/' +
                                        launchCuriosity_ry,
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
                                    'Arrive: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    arriveCuriosity_rm +
                                        '/' +
                                        arriveCuriosity_rd +
                                        '/' +
                                        arriveCuriosity_ry,
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
                                    'End: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    endCuriosity_rm +
                                        '/' +
                                        endCuriosity_rd +
                                        '/' +
                                        endCuriosity_ry,
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
                                  'Operator:',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                operatorCuriosity,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Manufacturer:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                manufacturerCuriosity,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: new Center(
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          25),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => askCuriosity(),
                                        ),
                                      );
                                    },
                                    color: Colors.white,
                                    child: new Text(
                                      'SEARCH',
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
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          'Curiosity',
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
                        'CURIOSITY',
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
                                    'DATE',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Curiositytimeformat == false
                                            ? Colors.white
                                            : Colors.black38),
                                  ),
                                  Tooltip(
                                    message: 'Select time format!',
                                    child: Switch(
                                      value: Curiositytimeformat,
                                      activeTrackColor: Colors.black38,
                                      inactiveTrackColor: Colors.black38,
                                      inactiveThumbColor: Colors.white,
                                      activeColor: Colors.white,
                                      onChanged: (bool value) {
                                        setState(() =>
                                        Curiositytimeformat = value);
                                      },
                                    ),
                                  ),
                                  Text(
                                    'SOL',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Curiositytimeformat == true
                                            ? Colors.white
                                            : Colors.black38),
                                  ),
                                ],
                              ),
                              Text(
                                'Date:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Curiositytimeformat == false
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                              Text(
                                '${_dateCuriosity.month}/${_dateCuriosity
                                    .day}/${_dateCuriosity.year}',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Curiositytimeformat == false
                                        ? Colors.white
                                        : Colors.black38,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: new Text(
                                  'SOL:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Curiositytimeformat == true
                                          ? Colors.white
                                          : Colors.black38),
                                ),
                              ),
                              Text(
                                '1000',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Curiositytimeformat == true
                                        ? Colors.white
                                        : Colors.black38),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: new Center(
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          25),
                                    ),
                                    onPressed: () {
                                      if (Curiositytimeformat == false) {
                                        final action = SizedBox(
                                            height: 200,
                                            child: CupertinoDatePicker(
                                              initialDateTime: _dateCuriosity,
                                              mode: CupertinoDatePickerMode
                                                  .date,
                                              backgroundColor: Colors.white,
                                              minimumDate: arriveCuriosity,
                                              maximumDate: maxCuriosity,
                                              onDateTimeChanged: (
                                                  dateCuriosity) {
                                                print(_dateCuriosity);
                                                setState(() {
                                                  _dateCuriosity =
                                                      dateCuriosity;
                                                });
                                              },
                                            ));
                                        showCupertinoModalPopup(
                                            context: context,
                                            builder: (context) => action);
                                      } else {
                                        final action = isnotavailable();
                                        showCupertinoModalPopup(
                                            context: context,
                                            builder: (context) => action);
                                      }
                                    },
                                    color: Colors.white,
                                    child: new Text(
                                      'SET TIME',
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
                              Center(
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            askCuriositySite(
                                                title: '${_dateCuriosity
                                                    .month}/${_dateCuriosity
                                                    .day}/${_dateCuriosity
                                                    .year}',
                                                url: 'https://codepen.io/KristofKekesi/full/eYmxpXK/?rover=curiosity&type=sol&num=100&key=Auy5Y3JzRVdcidYPuytq5KI7Mxfqnm1IPdEQoeYz'),
                                      ),
                                    );
                                  },
                                  color: Colors.white,
                                  child: new Text(
                                    'SEARCH',
                                    style: TextStyle(
                                      letterSpacing: 15.0,
                                      fontSize: 15,
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold,
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

// ignore: camel_case_types
class askCuriositySite extends StatefulWidget {
  final url;
  final title;
  askCuriositySite({Key key, this.url, this.title}) : super(key: key);

  createState() => _askCuriositySite();
}

class _askCuriositySite extends State<askCuriositySite> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewController _myController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          //onWebViewCreated: (WebViewController webViewController) {
          //  _controller.complete(webViewController);
          //  _myController = webWievController;
          //  _myController.evaculateJavascript(
          //      'document.getElemenById("main-header").style.display = "none";');
          //},
          //onPageFinished: (String url) {
          //  print('Page finished');
          //}
        )
    );
  }
}