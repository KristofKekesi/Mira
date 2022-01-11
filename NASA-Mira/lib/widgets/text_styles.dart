//ignore_for_file: avoid_classes_with_only_static_members

// Flutter
import "package:flutter/material.dart";

// TODO(KristofKekesi): Add color, letter spacing, weight, italic
// and decoration as optional parameters.

/// [SpaceJamTextStyles] are commonly used [TextStyle]s made for
/// general use in all kinds of applications.
class SpaceJamTextStyles {
  /// TextStyle for titles.
  static TextStyle title(BuildContext context) => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .06,
        color: Colors.black,
      );

  /// TextStyle for subtitles.
  static TextStyle subTitle(BuildContext context) => TextStyle(
        fontSize: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .04,
        color: Colors.black,
      );

  /// TextStyle for headlines.
  static TextStyle headline(
    BuildContext context, {
    Color color = Colors.black,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.width * .08,
        color: color,
      );

  // TODO(KristofKekesi): Finish it.
  /// TextStyle for subheadings.
  static TextStyle subHeadline(
    BuildContext context, {
    Color color = Colors.black,
    FontWeight weight = FontWeight.bold,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: MediaQuery.of(context).size.width * .05,
        color: color,
        fontWeight: weight,
      );

  /// TextStyle for captions.
  static TextStyle caption(
    BuildContext context, {
    Color color = Colors.white70,
    FontWeight weight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
  }) =>
      TextStyle(
        color: color,
        fontWeight: weight,
        decoration: decoration,
        fontSize: MediaQuery.of(context).size.height * .02,
      );

  /// TextStyle for default.
  static TextStyle defaultTextStyle(
    BuildContext context, {
    Color color = Colors.white,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: MediaQuery.of(context).size.height * .025,
      );
}
