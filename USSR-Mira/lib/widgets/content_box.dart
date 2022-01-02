// Flutter
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import './text_styles.dart';

class ContentBox extends StatelessWidget {
  final String title;

  final Widget? child;
  final List<Widget>? children;

  const ContentBox({Key? key, required this.title, this.child, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoSizeGroup contentBigTextSize = AutoSizeGroup();

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
                  title,
                  style: SpaceJamTextStyles.headline(context),
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
                      image: AssetImage('lib/images/ussr-background.jpg'),
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
                      children: child != null ? [child!] : children != null ? children! : [ErrorWidget("You must provide a Child or a Children property is not provided")],
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
