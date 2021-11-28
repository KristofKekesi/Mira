import 'dart:io';

import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../pass.dart';
import '../utils/localization.dart';

_fetchAPI(url) async {
  Dio dio = Dio();
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 30000;
  Response response = await dio.get(url);

  return response;
}

void _popup(context, title, copyright, url) {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

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
                        title,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * .025,
                          right: MediaQuery.of(context).size.height * .025),
                      child: Conditional.single(
                          context: context,
                          conditionBuilder: (BuildContext context) =>
                              copyright = null,
                          widgetBuilder: (BuildContext context) => Text(
                                copyright,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * .05,
                                    fontWeight: FontWeight.bold),
                              ),
                          fallbackBuilder: (BuildContext context) =>
                              Container()),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL(url);
                      },
                      child: Text(
                        url,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05),
                      ),
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
                  color: Color(0xffE8672D),
                  fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

class ApodWidget extends StatefulWidget {
  @override
  _ApodWidgetState createState() => _ApodWidgetState();
}

class _ApodWidgetState extends State<ApodWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchAPI(
            "https://api.nasa.gov/planetary/apod?api_key=$apiKey&thumbs=true"), //&date=2021-04-19
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data.data["media_type"] == "image" &&
              snapshot.data.data["thumbnail_url"] != "") {
            String mediaType = snapshot.data.data["media_type"];
            String copyright = snapshot.data.data["copyright"];
            String url = snapshot.data.data["url"];
            String thumbnailUrl = snapshot.data.data["thumbnail_url"];
            String title = snapshot.data.data["title"];

            String displayUrl() {
              if (mediaType == "image") {
                return url;
              } else {
                return thumbnailUrl;
              }
            }

            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * .0125),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(displayUrl()),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular((MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .04),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * .2,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Tooltip(
                    message: AppLocalizations.of(context).translate("more"),
                    child: GestureDetector(
                      onTap: () {
                        _popup(context, title, copyright, url);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                2 *
                                .03,
                            left: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                2 *
                                .03,
                            bottom: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                2 *
                                .03,
                            top: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                2 *
                                .03),
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(90 / 360),
                          child: Image(
                            image: AssetImage('lib/images/more.png'),
                            width: MediaQuery.of(context).size.width * .07,
                            height: MediaQuery.of(context).size.width * .07,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
