// Flutter
import "package:flutter/material.dart";

/// [SpaceJamTextStyles] are commonly used [TextStyle]s made for
/// general use in all kinds of applications.

class SpaceJamTextStyles {
  static TextStyle title(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: (MediaQuery.of(context).size.width +
          MediaQuery.of(context).size.height) /
          2 *
          .06,
      color: Colors.black,
    );
  }

  static TextStyle subTitle(BuildContext context) {
    return TextStyle(
      fontSize: (MediaQuery.of(context).size.width +
          MediaQuery.of(context).size.height) /
          2 *
          .04,
      color: Colors.black,
    );
  }

  static TextStyle headline(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: MediaQuery.of(context).size.width * .08,
      color: Colors.black,
    );
  }

  // todo
  static TextStyle subHeadline(BuildContext context) {
    return TextStyle();
  }

  // todo
  static TextStyle caption(BuildContext context) {
    return TextStyle();
  }

  // todo
  static TextStyle defaultTextStyle(BuildContext context) {
    return TextStyle();
  }
}