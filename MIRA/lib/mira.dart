library mira;

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class MiraApp {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  statusBarColor: Colors.black, statusBarBrightness: Brightness.light));
  runApp(App);
}

class App