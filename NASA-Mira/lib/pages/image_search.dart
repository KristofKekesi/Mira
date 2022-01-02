// Dart
import 'package:dio/dio.dart';

// Flutter
import 'package:flutter/material.dart';

// widgets
import '../widgets/appbar.dart';
import '../widgets/content_box.dart';
import '../widgets/button.dart';

// pages
import 'fullscreen.dart';

// utils
import '../utils/get_th.dart';
import '../utils/localization.dart';


_fetchAPI(String url) async {
  Dio dio = Dio();
  dio.options.connectTimeout = 30000;
  dio.options.receiveTimeout = 30000;
  Response<dynamic> response = await dio.get(url);

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

FutureBuilder<dynamic> _data(String url) {
  return FutureBuilder(
    future: _fetchAPI(url),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<dynamic> data = snapshot.data.data["photos"];

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
                              image: const DecorationImage(
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
            ContentBox(
              title: data[index]["id"].toString(),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02,
                  ),
                  child: SizedBox(
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
                                    builder: (context) => FullScreen(imageURL: data[index]["img_src"],),
                                  ),
                                );
                              },
                              child: Tooltip(
                                message: AppLocalizations.of(context).translate("fullscreen"),
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
                  child: Button(
                    title: AppLocalizations.of(context).translate("captured"),
                    value: data[index]["earth_date"].replaceAll("-", "/") +
                        " (" +
                        data[index]["sol"].toString() +
                        getTh(context, data[index]["sol"]) +
                        " sol)",

                    valueFontSize: MediaQuery.of(context).size.width * .08,
                    titleFontSize: MediaQuery.of(context).size.width * .05,
                  ),
                ),
                Button(
                  title: AppLocalizations.of(context).translate("camera"),
                  value: data[index]["camera"]["name"],

                  valueFontSize: MediaQuery.of(context).size.width * .08,
                  titleFontSize: MediaQuery.of(context).size.width * .05,
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
            SizedBox(
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
            const CircularProgressIndicator(
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
                  style: const TextStyle(
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

class SearchWindow extends StatefulWidget {
  final String name;
  final String url;
  final String time;

  const SearchWindow({Key? key, required this.name, required this.url, required this.time})
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
                  subtitle: widget.time,
                  leftAction:
                  const AppBarAction(
                    icon: Icons.arrow_back_rounded,
                  ),
                ),
              ),
              _data(widget.url),
            ],
          ),
          Appbar(
            title: widget.name,
            subtitle: widget.time,
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
