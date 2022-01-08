//ignore_for_file: avoid_classes_with_only_static_members

// Flutter
import "package:flutter/material.dart";

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
  static TextStyle headline(BuildContext context) => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: MediaQuery.of(context).size.width * .08,
      color: Colors.black,
    );

  // TODO(KristofKekesi): Finish it.
  /// TextStyle for subheadlines.
  static TextStyle subHeadline(BuildContext context) => TextStyle();

  // TODO(KristofKekesi): Finish it.
  /// TextStyle for captions.
  static TextStyle caption(BuildContext context) => TextStyle();

  // TODO(KristofKekesi): Finish it.
  /// TextStyle for default.
  static TextStyle defaultTextStyle(BuildContext context) => TextStyle();
}
