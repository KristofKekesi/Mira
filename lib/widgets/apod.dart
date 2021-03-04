import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:nasamira/pass.dart';
import 'package:nasamira/widgets/localization.dart';
import 'package:url_launcher/url_launcher.dart';

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

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      titlePadding: EdgeInsets.all(MediaQuery.of(context).size.height * .05),
      contentPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * .05,
          left: MediaQuery.of(context).size.height * .05,
          right: MediaQuery.of(context).size.height * .05),
      title: Text(
        title,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width * .05),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * .6,
        child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) => copyright = null,
                  widgetBuilder: (BuildContext context) => Text(
                    copyright,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05,
                        fontWeight: FontWeight.bold),
                  ),
                  fallbackBuilder: (BuildContext context) => Container()
                ),
                GestureDetector(
                  onTap: (){_launchURL(url);},
                  child:
                Text(
                  url,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .05),
                ),),
              ],
            ),
          ),
        ),
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
            "https://api.nasa.gov/planetary/apod?api_key=$apiKey&thumbs=true"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                              .015,
                          top: (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .015),
                      child: Icon(
                        Icons.more_horiz_rounded,
                        size: MediaQuery.of(context).size.width * .1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),),
            );
          } else {
            return Container();
          }
        });
  }
}
