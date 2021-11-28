import 'package:flutter/material.dart';

import '../utils/localization.dart';

bool boolIsReverse = false;
bool boolAreHelicoptersVisible = true;
bool boolAreRoversVisible = true;
bool boolAreOrbitersVisible = true;
bool boolAreLandersVisible = true;
bool boolAreFlybysVisible = true;

ValueNotifier<bool> notifierIsReverse = ValueNotifier(boolIsReverse);
ValueNotifier<bool> notifierAreHelicoptersVisible =
    ValueNotifier(boolAreHelicoptersVisible);
ValueNotifier<bool> notifierAreRoversVisible =
    ValueNotifier(boolAreRoversVisible);
ValueNotifier<bool> notifierAreOrbitersVisible =
    ValueNotifier(boolAreOrbitersVisible);
ValueNotifier<bool> notifierAreLandersVisible =
    ValueNotifier(boolAreLandersVisible);
ValueNotifier<bool> notifierAreFlybysVisible =
    ValueNotifier(boolAreFlybysVisible);

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
                      ),
                      child: Text(
                        AppLocalizations.of(context).translate("types"),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05,
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: Color(0xffE8672D),
                      value:
                          areTypesDisabled ? true : boolAreHelicoptersVisible,
                      onChanged: areTypesDisabled
                          ? null
                          : (value) {
                              setState(() {
                                boolAreHelicoptersVisible = value;
                              });
                            },
                      // todo localize all strings in this function
                      title: Text("Helicopters"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      activeColor: Color(0xffE8672D),
                      value: areTypesDisabled ? true : boolAreRoversVisible,
                      onChanged: areTypesDisabled
                          ? null
                          : (value) {
                              setState(() {
                                boolAreRoversVisible = value;
                              });
                            },
                      title: Text("Rovers"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      activeColor: Color(0xffE8672D),
                      value: areTypesDisabled ? true : boolAreOrbitersVisible,
                      onChanged: areTypesDisabled
                          ? null
                          : (value) {
                              setState(() {
                                boolAreOrbitersVisible = value;
                              });
                            },
                      title: Text("Orbiters"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      activeColor: Color(0xffE8672D),
                      value: areTypesDisabled ? true : boolAreLandersVisible,
                      onChanged: areTypesDisabled
                          ? null
                          : (value) {
                              setState(() {
                                boolAreLandersVisible = value;
                              });
                            },
                      title: Text("Landers"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      activeColor: Color(0xffE8672D),
                      value: areTypesDisabled ? true : boolAreFlybysVisible,
                      onChanged: areTypesDisabled
                          ? null
                          : (value) {
                              setState(() {
                                boolAreFlybysVisible = value;
                              });
                            },
                      title: Text("Flyby satelites"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .025,
                      ),
                      child: Text(
                        AppLocalizations.of(context).translate("sort"),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05,
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: Color(0xffE8672D),
                      value: boolIsReverse,
                      onChanged: (value) {
                        setState(() {
                          boolIsReverse = true;
                        });
                      },
                      title: Text(
                        AppLocalizations.of(context).translate("ascending"),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      activeColor: Color(0xffE8672D),
                      value: !boolIsReverse,
                      onChanged: (value) {
                        setState(() {
                          boolIsReverse = false;
                        });
                      },
                      title: Text(
                        AppLocalizations.of(context).translate("descending"),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
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
                  AppLocalizations.of(context).translate("back"),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .05,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  notifierAreHelicoptersVisible.value =
                      boolAreHelicoptersVisible;
                  notifierAreRoversVisible.value = boolAreRoversVisible;
                  notifierAreOrbitersVisible.value = boolAreOrbitersVisible;
                  notifierAreLandersVisible.value = boolAreLandersVisible;
                  notifierAreFlybysVisible.value = boolAreFlybysVisible;

                  notifierIsReverse.value = boolIsReverse;
                });
                Navigator.pop(context);
              },
              child: Text(
                "Search",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .05,
                    color: Color(0xffE8672D),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    ),
  );
}
