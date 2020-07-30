//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:nasamira/localization.dart';
//import 'package:nasamira/pages/search.dart';
//import 'package:numberpicker/numberpicker.dart';

String namePerseverance = 'Mars 2020 Perseverance';
String nickPerseverance = 'Perseverance';

String typePerseverance = 'rover';

// ignore: non_constant_identifier_names
int launchPerseverance_y = 2020;
// ignore: non_constant_identifier_names
int launchPerseverance_m = 7;
// ignore: non_constant_identifier_names
int launchPerseverance_d = 30;

// ignore: non_constant_identifier_names
int arrivePerseverance_y = 0;
// ignore: non_constant_identifier_names
int arrivePerseverance_m = 0;
// ignore: non_constant_identifier_names
int arrivePerseverance_d = 0;

// ignore: non_constant_identifier_names
int lcPerseverance_y = 0;
// ignore: non_constant_identifier_names
int lcPerseverance_m = 0;
// ignore: non_constant_identifier_names
int lcPerseverance_d = 0;

// ignore: non_constant_identifier_names
int endPerseverance_y = 0;
// ignore: non_constant_identifier_names
int endPerseverance_m = 0;
// ignore: non_constant_identifier_names
int endPerseverance_d = 0;

String getZero(input) {
  if (input < 10) {
    return '0' + input.toString();
  } else {
    return input.toString();
  }
}

String operatorPerseverance = 'NASA';
String manufacturerPerseverance = 'JPL';