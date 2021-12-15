// @dart=2.9

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../pages/fullscreen.dart';

import '../pass.dart';


_fetchAPI(url) async {
  Dio dio = Dio();
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 30000;
  Response response = await dio.get(url);

  return response;
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
            //String copyright = snapshot.data.data["copyright"];
            String url = snapshot.data.data["url"];
            String thumbnailUrl = snapshot.data.data["thumbnail_url"];
            //String title = snapshot.data.data["title"];

            String displayURL() {
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
                    image: NetworkImage(displayURL()),
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
                    // todo localize
                    message: "Fullscreen",
                    child: GestureDetector(
                      onTap: () {
                        //_popup(context, title, copyright, url);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return FullScreen(displayURL());
                            },
                          ),
                        );
                      },
                      child: Tooltip(
                          // todo localize
                          message: "Fullscreen",
                          child: Padding(
                            padding: EdgeInsets.all(
                                (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                    2 *
                                    .03),
                            child: Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width *
                                  .075,
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
