// Dart
import "dart:io";

// Flutter
import "package:flutter/material.dart";

// Widgets
import "min.dart";

// utils
import "../pass.dart";

/// The Application widget is used in the [PromoWidget].
class Application extends StatelessWidget {
  /// Constructor
  const Application({
    required this.name,
    required this.logo,
    this.themeColor,
    this.background,
    Key? key,
  }) : super(key: key);

  /// The name of the app.
  final String name;
  /// Path to the logo of the app.
  final String logo;
  /// Path to the background of the app.
  final String? background;
  /// Defining color of the app.
  final Color? themeColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .0125,
            right: MediaQuery.of(context).size.width * .0125,
            bottom: MediaQuery.of(context).size.width * .025,),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02,
                  ),
                ),
                child: themeColor != null
                    ? ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(themeColor!, BlendMode.color),
                        child: const Image(
                          image: AssetImage(appBackground),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    : Image(
                        image: AssetImage(background!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
              ),
              Tooltip(
                message: name,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04,
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .035),
                  child: Opacity(
                    opacity: .25,
                    child: Image(
                      image: AssetImage(logo),
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

/// A Scrollable widget used to promote apps.
class PromoWidget extends StatelessWidget {
  /// Constructor
  const PromoWidget({
    required this.children,
    required this.height,
    Key? key,
  }) : super(key: key);

  /// List of [Application]s to display.
  final List<Application> children;
  /// The wanted height of the [PromoWidget].
  final double height;

  @override
  Widget build(BuildContext context) {
    Future<bool> _widgetOpacity() async {
      try {
        final result = await InternetAddress.lookup("google.com");
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } catch (_) {}
      return false;
    }

    return FutureBuilder<bool>(
      future: _widgetOpacity(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data ?? false) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: height,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .075,
                  ),
                  ...children,
                  Container(
                    width: MediaQuery.of(context).size.width * .075,
                  ),
                ],
              ),
            );
          } else {
            return const Min();
          }
        } else {
          return const Min();
        }
      },
    );
  }
}
