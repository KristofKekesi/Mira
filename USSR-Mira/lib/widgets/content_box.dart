// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";

// utils
import "../pass.dart";

/// Custom decorated widget to display information.
class ContentBox extends StatelessWidget {
  /// Constructor
  const ContentBox({
    required this.title,
    this.child,
    this.children,
    Key? key,
  }) : super(key: key);

  /// Title displayed at the top.
  final String title;

  /// Child of the widget.
  final Widget? child;

  /// Children of the widget.
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final AutoSizeGroup contentBigTextSize = AutoSizeGroup();

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
                      MediaQuery.of(context).size.width * .05,
                ),
                child: AutoSizeText(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 1,
                  group: contentBigTextSize,
                ),
              ),
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
                            MediaQuery.of(context).size.height) /
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: child != null
                          ? <Widget>[child!]
                          : children != null
                          ? children!
                          : <ErrorWidget>[
                        ErrorWidget(
                          "You must provide a Child or a Children "
                              "property is not provided",
                        )
                      ],
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
