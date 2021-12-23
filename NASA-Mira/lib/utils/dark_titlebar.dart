import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void darkTitlebar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black, statusBarBrightness: Brightness.light));
}