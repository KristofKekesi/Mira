// Flutter
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'min.dart';

class AutoSizeTextStyle {
  // constructor
  const AutoSizeTextStyle({this.maxLines = 1, this.group});

  final int maxLines;
  final AutoSizeGroup? group;
}

class IconStyle {
  // constructor
  const IconStyle({this.size = 24, this.color});

  final int size;
  final Color? color;
}

class Button extends StatelessWidget {
  // constructor
  const Button(
      {Key? key,
        this.background = Colors.white12,
        this.valueTextStyle = const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        required this.valueFontSize,
        this.titleTextStyle = const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        required this.titleFontSize,
        this.tooltip = "",
        this.title,
        this.iconStyle = const IconStyle(color: null),
        this.autoSizeTextStyle = const AutoSizeTextStyle(),
        this.action,
        this.valueSizeGroup,
        this.value})
      : super(key: key);

  final Color background;

  final String? title;
  final TextStyle titleTextStyle;

  /// [titleFontSize] is usually `MediaQuery.of(context).size.width * .05`
  final double titleFontSize;

  final dynamic value;
  final TextStyle valueTextStyle;

  /// [valueFontSize] is usually `MediaQuery.of(context).size.width * .08`
  final double valueFontSize;

  final IconStyle iconStyle;
  final AutoSizeTextStyle autoSizeTextStyle;

  final AutoSizeGroup? valueSizeGroup;

  final String tooltip;

  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    TextStyle primaryFinalTextStyle =
        valueTextStyle.copyWith(fontSize: valueFontSize);
    TextStyle secondaryFinalTextStyle =
        titleTextStyle.copyWith(fontSize: titleFontSize);

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
          color: background,
        ),
        child: Padding(
          padding: EdgeInsets.all((MediaQuery.of(context).size.width +
                  MediaQuery.of(context).size.height) /
              2 *
              .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// conditional to render text with title or not
              title != null
                  ? Text(
                      title!,
                      style: secondaryFinalTextStyle,
                    )
                  : const Min(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9 -
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04 -
                        MediaQuery.of(context).size.width * .175,
                    child: value is String
                        ? AutoSizeText(
                            value,
                            style: primaryFinalTextStyle,
                            maxLines: autoSizeTextStyle.maxLines,
                            group: autoSizeTextStyle.group,
                          )
                        : value,
                  ),

                  /// conditional to render icon or not
                  action != null
                      ? Tooltip(
                          message: tooltip,
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: MediaQuery.of(context).size.width * .075,
                            color: iconStyle.color ?? valueTextStyle.color,
                          ),
                        )
                      : const Min(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
