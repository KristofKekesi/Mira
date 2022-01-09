// Ignore because working with API calls with complex Map returns.
//ignore_for_file: avoid_dynamic_calls

// Dart
import "package:dio/dio.dart";

// Flutter
import "package:flutter/material.dart";
import "./min.dart";

// pages
import "../pages/fullscreen.dart";

// utils
import "../utils/localization.dart";
import "../pass.dart";

// TODO(KristofKekesi): _fetchAPI into a new utility file.
Future<Response<dynamic>> _fetchAPI(String url) async {
  final Dio dio = Dio();
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 30000;
  final Response<dynamic> response = await dio.get(url);

  return response;
}

/// The astronomy picture of day widget. This shows the
/// image in asimilar way like an item in a collection.
class ApodWidget extends StatefulWidget {
  /// Constructor
  const ApodWidget({Key? key}) : super(key: key);

  @override
  ApodWidgetState createState() => ApodWidgetState();
}

/// The stateful part of the widget.
class ApodWidgetState extends State<ApodWidget> {
  @override
  Widget build(BuildContext context) => FutureBuilder<dynamic>(
        future: _fetchAPI(
          "https://api.nasa.gov/planetary/apod?api_key=$apiKey&thumbs=true",
        ), //&date=2021-04-19
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData && snapshot.data.data["thumbnail_url"] != "") {
            final String mediaType = snapshot.data.data["media_type"];
            final String url = snapshot.data.data["url"];
            final String? thumbnailUrl = snapshot.data.data["thumbnail_url"];

            String displayURL() {
              if (mediaType == "image") {
                return url;
              } else {
                return thumbnailUrl ?? "";
              }
            }

            return Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * .03,
                bottom: MediaQuery.of(context).size.width * .0125,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(displayURL()),
                    fit: BoxFit.contain,
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
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * .2,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      //_popup(context, title, copyright, url);
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => FullScreen(
                            imageURL: displayURL(),
                          ),
                        ),
                      );
                    },
                    child: Tooltip(
                      message:
                          AppLocalizations.of(context).translate("fullscreen"),
                      child: Padding(
                        padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .03,
                        ),
                        child: Icon(
                          Icons.fullscreen,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * .075,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Min();
          }
        },
      );
}
