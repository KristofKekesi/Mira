// Ignore because working with API calls with complex Map returns.
//ignore_for_file: avoid_dynamic_calls

// Dart
import "package:dio/dio.dart";

// Flutter
import "package:flutter/material.dart";
import "package:spacejam/spacejam.dart";

// utils
import "../pass.dart";
import "../utils/fetch.dart";
import "../utils/get_th.dart";
import "../utils/localization.dart";

/// A string function to return correct translation based on plurality.
String imageCounter(BuildContext context, int num) {
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

FutureBuilder<Response<dynamic>> _imageSearchResult(String url) =>
    FutureBuilder<Response<dynamic>>(
      future: fetchAPI(url),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          final List<dynamic> data = snapshot.data.data["photos"];

          final List<Widget> serializedImages = <Widget>[];

          if (data.isEmpty) {
            serializedImages.add(
              Padding(
                padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .04,
                ),
                child: Text(
                  AppLocalizations.of(context).translate("imgNoRes"),
                  style: SpaceJamTextStyles.bodySmall(
                    context,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }

          for (int index = 0; index < data.length; index++) {
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
                                  image: AssetImage(appBackground),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    (MediaQuery.of(context).size.width +
                                            MediaQuery.of(context)
                                                .size
                                                .height) /
                                        2 *
                                        .04,
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * .9,
                              child: Padding(
                                padding: EdgeInsets.all(
                                  (MediaQuery.of(context).size.width +
                                          MediaQuery.of(context).size.height) /
                                      2 *
                                      .02,
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        (MediaQuery.of(context).size.width +
                                                MediaQuery.of(context)
                                                    .size
                                                    .height) /
                                            2 *
                                            .02,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      (MediaQuery.of(context).size.width +
                                              MediaQuery.of(context)
                                                  .size
                                                  .height) /
                                          2 *
                                          .02,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                            right: (MediaQuery.of(context)
                                                        .size
                                                        .width +
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height) /
                                                2 *
                                                .02,
                                          ),
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
                                          style:
                                              SpaceJamTextStyles.headlineSmall(
                                            context,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
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
              SpaceJamContainer(
                title: data[index]["id"].toString(),
                backgroundImage: const DecorationImage(
                  image: AssetImage(appBackground),
                  fit: BoxFit.cover,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .02,
                      ),
                      child: SpaceJamImageBox(
                        Image.network(
                          data[index]["img_src"],
                        ),
                        imageURL: data[index]["img_src"],
                        autoHeight: true,
                        semanticLabel:
                            "An image made by the Perseverance rover.",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .02,
                      ),
                      child: SpaceJamButton(
                        title:
                            AppLocalizations.of(context).translate("captured"),
                        value: data[index]["earth_date"].replaceAll("-", "/") +
                            " (" +
                            data[index]["sol"].toString() +
                            getTh(context, data[index]["sol"]) +
                            " sol)",
                        valueFontSize: MediaQuery.of(context).size.width * .08,
                        titleFontSize: MediaQuery.of(context).size.width * .05,
                      ),
                    ),
                    SpaceJamButton(
                      title: AppLocalizations.of(context).translate("camera"),
                      value: data[index]["camera"]["name"],
                      valueFontSize: MediaQuery.of(context).size.width * .08,
                      titleFontSize: MediaQuery.of(context).size.width * .05,
                    )
                  ],
                ),
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
                      AppLocalizations.of(context).translate("imgError"),
                      style: SpaceJamTextStyles.bodySmall(
                        context,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${snapshot.error}",
                      style: SpaceJamTextStyles.bodySmall(
                        context,
                        color: Colors.black,
                      ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate("loading"),
                    style: SpaceJamTextStyles.bodyMedium(
                      context,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );

/// Shows the images based on the search.
class SearchWindow extends StatefulWidget {
  /// Constructor
  const SearchWindow({
    required this.name,
    required this.url,
    required this.time,
    Key? key,
  }) : super(key: key);

  /// The name displayed in appbar.
  final String name;

  /// The URL from where to query the images.
  final String url;

  /// The date / SOL when the images were captured.
  final String time;

  @override
  SearchWindowState createState() => SearchWindowState();
}

/// The stateful part of the widget.
class SearchWindowState extends State<SearchWindow> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SpaceJamPage(
          animated: "off",
          title: widget.name,
          subtitle: widget.time,
          locale: AppLocalizations.of(context).locale,
          appBarLeftAction: SpaceJamAppBarAction(
            Icons.arrow_back_rounded,
            tooltip: AppLocalizations.of(context).translate("back"),
            action: () {
              Navigator.pop(context);
            },
          ),
          children: <Widget>[
            _imageSearchResult(widget.url),
          ],
        ),
      );
}
