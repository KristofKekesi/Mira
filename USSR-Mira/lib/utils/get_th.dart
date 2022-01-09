// Flutter
import "package:flutter/material.dart";

// utils
import "localization.dart";

/// Returns endings like st, nd, rd and th.
String getTh(BuildContext context,int num) {
  final String last = num.toString()[num.toString().length - 1];
  if (last == "0") {
    return AppLocalizations.of(context).translate("serial0");
  } else if (last == "1") {
    return AppLocalizations.of(context).translate("serial1");
  } else if (last == "2") {
    return AppLocalizations.of(context).translate("serial2");
  } else if (last == "3") {
    return AppLocalizations.of(context).translate("serial3");
  } else if (last == "4") {
    return AppLocalizations.of(context).translate("serial4");
  } else if (last == "5") {
    return AppLocalizations.of(context).translate("serial5");
  } else if (last == "6") {
    return AppLocalizations.of(context).translate("serial6");
  } else if (last == "7") {
    return AppLocalizations.of(context).translate("serial7");
  } else if (last == "8") {
    return AppLocalizations.of(context).translate("serial8");
  } else {
    return AppLocalizations.of(context).translate("serial9");
  }
}
