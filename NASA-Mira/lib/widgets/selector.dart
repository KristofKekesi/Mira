// Flutter
import 'package:flutter/material.dart';

// utils
import '../utils/localization.dart';

ValueNotifier<bool> notifierIsReverse = ValueNotifier(false);
ValueNotifier<bool> notifierAreHelicoptersVisible = ValueNotifier(true);
ValueNotifier<bool> notifierAreRoversVisible = ValueNotifier(true);
ValueNotifier<bool> notifierAreOrbitersVisible = ValueNotifier(true);
ValueNotifier<bool> notifierAreLandersVisible = ValueNotifier(true);
ValueNotifier<bool> notifierAreFlybysVisible = ValueNotifier(true);

void showSelectors(context, page, areTypesDisabled) {
  showDialog(
    context: context,
    builder: (_) => StatefulBuilder(
      // You need this, notice the parameters below:
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * .025,
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * .025,
                  right: MediaQuery.of(context).size.height * .025,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .025,
                      ),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate("selectorsandsort"),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .025,
                        bottom: MediaQuery.of(context).size.height * .01,
                      ),
                      child: Text(
                        AppLocalizations.of(context).translate("types"),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 16,
                      children: [
                        InputChip(
                          tooltip: AppLocalizations.of(context)
                              .translate("helicopters"),
                          label: Text(
                            AppLocalizations.of(context)
                                .translate("helicopters"),
                            style: TextStyle(
                              color: notifierAreHelicoptersVisible.value && !areTypesDisabled
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          showCheckmark: false,
                          backgroundColor: Color.fromRGBO(232, 103, 45, .3),
                          selectedColor: Color.fromRGBO(232, 103, 45, .75),
                          disabledColor: Color(0xffcccccc),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selectedShadowColor: Color.fromRGBO(0, 0, 0, 0),
                          isEnabled: !areTypesDisabled,
                          selected: areTypesDisabled
                              ? false
                              : notifierAreHelicoptersVisible.value,
                          onSelected: (value) {
                            setState(() {
                              notifierAreHelicoptersVisible.value = value;
                            });
                          },
                        ),
                        InputChip(
                          tooltip:
                              AppLocalizations.of(context).translate("rovers"),
                          label: Text(
                            AppLocalizations.of(context).translate("rovers"),
                            style: TextStyle(
                              color: notifierAreRoversVisible.value && !areTypesDisabled
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          showCheckmark: false,
                          backgroundColor: Color.fromRGBO(232, 103, 45, .3),
                          selectedColor: Color.fromRGBO(232, 103, 45, .75),
                          disabledColor: Color(0xffcccccc),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selectedShadowColor: Color.fromRGBO(0, 0, 0, 0),
                          isEnabled: !areTypesDisabled,
                          selected: areTypesDisabled
                              ? false
                              : notifierAreRoversVisible.value,
                          onSelected: (value) {
                            setState(() {
                              notifierAreRoversVisible.value = value;
                            });
                          },
                        ),
                        InputChip(
                          tooltip: AppLocalizations.of(context)
                              .translate("orbiters"),
                          label: Text(
                            AppLocalizations.of(context).translate("orbiters"),
                            style: TextStyle(
                              color: notifierAreOrbitersVisible.value && !areTypesDisabled
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          showCheckmark: false,
                          backgroundColor: Color.fromRGBO(232, 103, 45, .3),
                          selectedColor: Color.fromRGBO(232, 103, 45, .75),
                          disabledColor: Color(0xffcccccc),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selectedShadowColor: Color.fromRGBO(0, 0, 0, 0),
                          isEnabled: !areTypesDisabled,
                          selected: areTypesDisabled
                              ? false
                              : notifierAreOrbitersVisible.value,
                          onSelected: (value) {
                            setState(() {
                              notifierAreOrbitersVisible.value = value;
                            });
                          },
                        ),
                        InputChip(
                          tooltip:
                              AppLocalizations.of(context).translate("landers"),
                          label: Text(
                            AppLocalizations.of(context).translate("landers"),
                            style: TextStyle(
                              color: notifierAreLandersVisible.value && !areTypesDisabled
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          showCheckmark: false,
                          backgroundColor: Color.fromRGBO(232, 103, 45, .3),
                          selectedColor: Color.fromRGBO(232, 103, 45, .75),
                          disabledColor: Color(0xffcccccc),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selectedShadowColor: Color.fromRGBO(0, 0, 0, 0),
                          isEnabled: !areTypesDisabled,
                          selected: areTypesDisabled
                              ? false
                              : notifierAreLandersVisible.value,
                          onSelected: (value) {
                            setState(() {
                              notifierAreLandersVisible.value = value;
                            });
                          },
                        ),
                        InputChip(
                          tooltip:
                              AppLocalizations.of(context).translate("flybys"),
                          label: Text(
                            AppLocalizations.of(context).translate("flybys"),
                            style: TextStyle(
                              color: notifierAreFlybysVisible.value && !areTypesDisabled
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          showCheckmark: false,
                          backgroundColor: Color.fromRGBO(232, 103, 45, .3),
                          selectedColor: Color.fromRGBO(232, 103, 45, .75),
                          disabledColor: Color(0xffcccccc),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selectedShadowColor: Color.fromRGBO(0, 0, 0, 0),
                          isEnabled: !areTypesDisabled,
                          selected: areTypesDisabled
                              ? false
                              : notifierAreFlybysVisible.value,
                          onSelected: (value) {
                            setState(() {
                              notifierAreFlybysVisible.value = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .025,
                        bottom: MediaQuery.of(context).size.height * .01,
                      ),
                      child: Text(
                        AppLocalizations.of(context).translate("sort"),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05,
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 16,
                      children: [
                        InputChip(
                          tooltip: AppLocalizations.of(context)
                              .translate("ascending"),
                          label: Text(
                            AppLocalizations.of(context).translate("ascending"),
                            style: TextStyle(
                              color: notifierIsReverse.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          showCheckmark: false,
                          backgroundColor: Color.fromRGBO(232, 103, 45, .3),
                          selectedColor: Color.fromRGBO(232, 103, 45, .75),
                          disabledColor: Color(0xffcccccc),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selectedShadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selected: notifierIsReverse.value,
                          onSelected: (value) {
                            setState(() {
                              notifierIsReverse.value = true;
                            });
                          },
                        ),
                        InputChip(
                          tooltip: AppLocalizations.of(context)
                              .translate("descending"),
                          label: Text(
                            AppLocalizations.of(context)
                                .translate("descending"),
                            style: TextStyle(
                              color: !notifierIsReverse.value
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          showCheckmark: false,
                          backgroundColor: Color.fromRGBO(232, 103, 45, .3),
                          selectedColor: Color.fromRGBO(232, 103, 45, .75),
                          disabledColor: Color(0xffcccccc),
                          shadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selectedShadowColor: Color.fromRGBO(0, 0, 0, 0),
                          selected: !notifierIsReverse.value,
                          onSelected: (value) {
                            setState(() {
                              notifierIsReverse.value = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actionsPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * .025,
            right: MediaQuery.of(context).size.height * .025,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * .025,
                ),
                child: Text(
                  AppLocalizations.of(context).translate("ok"),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .05,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
