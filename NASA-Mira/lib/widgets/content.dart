// @dart=2.9

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String title;
  final String nick;

  final Widget child;
  final List<Widget> children;

  const Content({Key key, this.title = "", this.nick, this.child, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoSizeGroup specPageBigText;

    return Padding(
      padding: EdgeInsets.only(
        top: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .04,
        bottom: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .04,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04 +
                        MediaQuery.of(context).size.width * .05),
                child: AutoSizeText(
                  nick == null ? title : nick,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .08,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  group: specPageBigText,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular((MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: EdgeInsets.all((MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: child != null ? [child] : children != null ? children : [ErrorWidget("Child / Children property is not provided")],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
