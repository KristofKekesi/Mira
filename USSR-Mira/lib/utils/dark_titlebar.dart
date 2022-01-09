import "package:flutter/material.dart";
import "package:flutter/services.dart";

/// Utility function to darken the title bar.
void darkTitlebar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black, statusBarBrightness: Brightness.light,),);
}
