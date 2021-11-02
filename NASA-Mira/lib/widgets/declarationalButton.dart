import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DeclarationalButton extends StatelessWidget {
  final background;
  final foreground;
  final secondary;

  // todo add tooltip
  final String tooltip;
  final String title;
  final String value;

  final action;

  final AutoSizeGroup valueSizeGroup;

  const DeclarationalButton(
      {Key key, this.background, this.title, this.value, this.action, this.valueSizeGroup, this.foreground, this.secondary, this.tooltip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        width: MediaQuery.of(context).size.width * .9 -
            (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                2 *
                .02,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular((MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                2 *
                .02),
          ),
          color: background != null ? background : Colors.white12,
        ),
        child: Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width +
                  MediaQuery.of(context).size.height) /
              2 *
              .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .05,
                  fontWeight: FontWeight.bold,
                  color: secondary != null ? secondary : Colors.white70,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .9 -
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04 -
                        MediaQuery.of(context).size.width * .175,
                    child: AutoSizeText(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .08,
                        color: foreground != null ? foreground : Colors.white,
                      ),
                      maxLines: 1,
                      group: valueSizeGroup,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: MediaQuery.of(context).size.width * .075,
                    color: foreground != null ? foreground : Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
