import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasamira/widgets/appbars.dart';

import '../utils/localization.dart';

void _popup(context, name, id, cameraFullName, date, sol, url) {
  // ignore: missing_return
  Future<bool> _widgetOpacity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .025,
      ),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FutureBuilder<bool>(
                  future: _widgetOpacity(),
                  // a previously-obtained Future<String> or null
                  // ignore: missing_return
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == true) {
                        return ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                          child: Image(
                            image: NetworkImage(url),
                            width: MediaQuery.of(context).size.width,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    } else {
                      return Container();
                    }
                  }),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * .025,
                  right: MediaQuery.of(context).size.height * .025,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .025,
                        bottom: MediaQuery.of(context).size.height * .025,
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).translate('popId'),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .015),
                      child: Text(
                        id.toString(),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).translate('popCamera'),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .015),
                      child: Tooltip(
                        message: cameraFullName,
                        child: Text(
                          cameraFullName,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * .05),
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).translate('popDate'),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .015),
                      child: Text(
                        date.replaceAll("-", "/"),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).translate('popSol'),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05),
                    ),
                    Text(
                      sol.toString(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actionsPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .025,
        right: MediaQuery.of(context).size.height * .025,
      ),
      actions: [
        GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Text(
            AppLocalizations.of(context).translate("back"),
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * .05,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

_fetchAPI(url) async {
  Dio dio = Dio();
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  Response response = await dio.get(url);

  return response;
}

String imageCounter(context, int num) {
  if (num < 1) {
    return AppLocalizations.of(context)
        .translate("imageCounterSingular")
        .replaceAll("{0}", num.toString());
  } else {
    return AppLocalizations.of(context)
        .translate("imageCounterPlural")
        .replaceAll("{0}", num.toString());
  }
}

// ignore: non_constant_identifier_names
FutureBuilder _Data(url) {
  return FutureBuilder(
    future: _fetchAPI(url),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List data = snapshot.data.data["photos"];
        return ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05 +
                      (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04,
                  top: MediaQuery.of(context).size.width * .1,
                  bottom: MediaQuery.of(context).size.width * .02,
                ),
                child: Text(
                  imageCounter(context, data.length),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * .05,
                    color: Colors.black,
                  ),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .05,
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05),
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            image: NetworkImage(data[index - 1]["img_src"]),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .04),
                            topRight: Radius.circular(
                                (MediaQuery.of(context).size.width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .04),
                          )),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .4,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              (MediaQuery.of(context).size.width +
                                      MediaQuery.of(context).size.height) /
                                  2 *
                                  .04),
                          bottomRight: Radius.circular(
                              (MediaQuery.of(context).size.width +
                                      MediaQuery.of(context).size.height) /
                                  2 *
                                  .04),
                        ),
                        image: DecorationImage(
                            image: AssetImage('lib/images/background.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .02,
                          bottom: MediaQuery.of(context).size.height * .02,
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              data[index - 1]["rover"]["name"] +
                                  ' - ' +
                                  data[index - 1]["id"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    MediaQuery.of(context).size.width * .05,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _popup(
                                    context,
                                    data[index - 1]["rover"]["name"],
                                    data[index - 1]["id"],
                                    data[index - 1]["camera"]["full_name"],
                                    data[index - 1]["earth_date"],
                                    data[index - 1]["sol"],
                                    data[index - 1]["img_src"]);
                              },
                              child: Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("more"),
                                child: Image(
                                  image: AssetImage('lib/images/more.png'),
                                  width:
                                      MediaQuery.of(context).size.width * .07,
                                  height:
                                      MediaQuery.of(context).size.width * .07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else if (snapshot.hasError) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate('imgError'),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .1),
                  ),
                  Text(
                    "${snapshot.error}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05),
              child: Text(
                AppLocalizations.of(context).translate('loading'),
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
        ],
      );
    },
  );
}

// ignore: camel_case_types
class SearchWindow extends StatefulWidget {
  final String name;
  final String url;
  final String date;

  const SearchWindow({Key key, this.name, this.url, this.date}) : super(key: key);

  @override
  _SearchWindowState createState() => _SearchWindowState();
}

// ignore: camel_case_types
class _SearchWindowState extends State<SearchWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          children: <Widget> [
      SingleChildScrollView(
        child:
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
          _Data(widget.url),
        ),),
            Appbar(title: widget.name, subtitle: widget.date,
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
                      Icons.arrow_back,
                      size: MediaQuery.of(context).size.width * .075,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),),
      ],
      ),
    );
  }
}
