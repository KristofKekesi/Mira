// Dart
import 'dart:io';

// Flutter
import 'package:flutter/material.dart';

import 'min.dart';

class Application extends StatelessWidget {
  final String name;
  final String logo;
  final Color themeColor;

  const Application(
      {Key? key,
      required this.name,
      required this.logo,
      required this.themeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .0125,
          right: MediaQuery.of(context).size.width * .0125,
          bottom: MediaQuery.of(context).size.width * .025),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular((MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .02),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(themeColor, BlendMode.color),
                child: const Image(
                  image: AssetImage('lib/images/nasa-background.jpg'),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Tooltip(
              message: name,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular((MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .04),
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .035),
                child:
                    Opacity(
                      opacity: .25,
                      child:
                    Image(
                      image: AssetImage(logo),
                      width: MediaQuery.of(context).size.width * .2,
                    ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromoWidget extends StatelessWidget {
  const PromoWidget({Key? key, required this.children, required this.height}) : super(key: key);

  final List<Application> children;
  final double height;

  @override
  Widget build(BuildContext context) {
    Future<bool> _widgetOpacity() async {
      try {
        final result = await InternetAddress.lookup('google.com');
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
            if (snapshot.data == true) {
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
        });
  }
}
