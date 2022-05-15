// Dart
import "dart:io" show Platform;

// Flutter
import "package:flutter/material.dart";
import "package:flutter/services.dart";

/// Utility function to darken the title bar.
void setTitlebar(String theme) {
  Brightness dark = Brightness.dark;
  Brightness light = Brightness.light;

  if (Platform.isIOS) {
    dark = Brightness.light;
    light = Brightness.dark;
  }

  if (theme == "light") {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        statusBarBrightness: dark,
      ),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        statusBarBrightness: light,
      ),
    );
  }
}
