// Ignore because working with API calls with complex Map returns.
//ignore_for_file: avoid_dynamic_calls

// Flutter
import "package:flutter/foundation.dart";
import "package:spacejam/spacejam.dart";
import "package:flutter/services.dart";
import "package:flutter/material.dart";
import "./min.dart";

// utils
import "../utils/fetch.dart";
import "../pass.dart";

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
        future: fetchAPI(
          "https://api.nasa.gov/planetary/apod?api_key=$apiKey&thumbs=true&date=2021-04-19",),
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
              ),
              child: SpaceJamImageBox(
                Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
              ),
            );
          } else {
            if (snapshot.hasError) {
              if (kDebugMode) {
                print(snapshot.error);
              }
            }
            return const Min();
          }
        },
      );
}
