// @dart=2.9

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import '../widgets/appbars.dart';
import '../widgets/content.dart';
import '../widgets/declarationalButton.dart';

import 'fullscreen.dart';

import '../utils/getTh.dart';
import '../utils/localization.dart';


_fetchAPI(url) async {
  Dio dio = Dio();
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  Response response = await dio.get(url);
  print(response.statusCode);

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

FutureBuilder _data(url) {
  return FutureBuilder(
    future: _fetchAPI(url),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List data = snapshot.data.data["photos"];

        List<Widget> serializedImages = [];
        for (var index = 0; index < data.length; index++) {
          if (index == 0) {
            serializedImages.add(
              Padding(
                padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .04,
                  bottom: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05,
                            right: MediaQuery.of(context).size.width * .05,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('lib/images/background.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular((MediaQuery.of(context)
                                            .size
                                            .width +
                                        MediaQuery.of(context).size.height) /
                                    2 *
                                    .04),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * .9,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.width +
                                          MediaQuery.of(context).size.height) /
                                      2 *
                                      .02),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        (MediaQuery.of(context).size.width +
                                                MediaQuery.of(context)
                                                    .size
                                                    .height) /
                                            2 *
                                            .02),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.width +
                                              MediaQuery.of(context)
                                                  .size
                                                  .height) /
                                          2 *
                                          .02),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: (MediaQuery.of(context)
                                                        .size
                                                        .width +
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height) /
                                                2 *
                                                .02),
                                        child: Icon(
                                          Icons.info,
                                          color: Colors.white70,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .05,
                                        ),
                                      ),
                                      Text(
                                        imageCounter(context, data.length),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .05,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          serializedImages.add(
            Content(
              title: data[index]["id"].toString(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular((MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .02),
                        ),
                        color: Colors.black,
                      ),
                      width: MediaQuery.of(context).size.width * .9 -
                          (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .02,
                      //height: MediaQuery.of(context).size.height * .4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular((MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .02),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.network(
                              data[index]["img_src"],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullScreen(data[index]["img_src"],),
                                  ),
                                );
                              },
                              child: Tooltip(
                                // todo localize
                                message: "Fullscreen",
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.width +
                                              MediaQuery.of(context)
                                                  .size
                                                  .height) /
                                          2 *
                                          .02),
                                  child: Icon(
                                    Icons.fullscreen,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.width *
                                        .075,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .02),
                  child: DeclarationalButton(
                    // todo localize
                    title: "Captured",
                    value: data[index]["earth_date"].replaceAll("-", "/") +
                        " (" +
                        data[index]["sol"].toString() +
                        getTh(context, data[index]["sol"]) +
                        " sol)",
                  ),
                ),
                DeclarationalButton(
                  // todo localize
                  title: "Camera",
                  value: data[index]["camera"]["name"],
                )
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: serializedImages,
          ),
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
      } else {
        return Padding(
          padding: EdgeInsets.only(
            top: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
                2 *
                .04,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * .05),
                child: Text(
                  AppLocalizations.of(context).translate('loading'),
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),),
          ],
        ),);
      }
    },
  );
}

// ignore: camel_case_types
class SearchWindow extends StatefulWidget {
  final String name;
  final String url;
  final String date;

  const SearchWindow({Key key, this.name, this.url, this.date})
      : super(key: key);

  @override
  _SearchWindowState createState() => _SearchWindowState();
}

// ignore: camel_case_types
class _SearchWindowState extends State<SearchWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Opacity(
                opacity: 0,
                child: Appbar(
                  title: widget.name,
                  subtitle: widget.date,
                  leftAction: Padding(
                    padding: EdgeInsets.only(
                        right: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .02),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: MediaQuery.of(context).size.width * .075,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              _data(widget.url),
            ],
          ),
          Appbar(
            title: widget.name,
            subtitle: widget.date,
            leftAction: Tooltip(
              message: AppLocalizations.of(context).translate("back"),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .02),
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
