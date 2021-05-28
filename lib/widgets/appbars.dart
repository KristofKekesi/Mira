import 'dart:ui';

import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leftAction;
  final Widget rightAction;

  const Appbar(
      {Key key, this.title, this.subtitle, this.leftAction, this.rightAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget subtitleWidget() {
      if (subtitle == null || subtitle == "") {
        return Container();
      } else {
        return Text(
          subtitle,
          style: TextStyle(
            fontSize: (MediaQuery
                .of(context)
                .size
                .width +
                MediaQuery
                    .of(context)
                    .size
                    .height) /
                2 *
                .04,
            color: Colors.black,
          ),
        );
      }
    }

    return Container(
      alignment: Alignment.topLeft,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: (MediaQuery.of(context).size.height +
                      MediaQuery.of(context).size.width) /
                  2 *
                  .02,
              sigmaY: (MediaQuery.of(context).size.height +
                      MediaQuery.of(context).size.width) /
                  2 *
                  .02),
          child: Container(
            color: Color.fromRGBO(255, 255, 255, .4),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * .05,
                bottom: MediaQuery.of(context).size.width * .05,
                left: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .04,
                right: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                    2 *
                    .04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                              2 *
                              .06,
                          color: Colors.black,
                        ),),
                      subtitleWidget(),
                    ],
                  ),
                  rightAction,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
