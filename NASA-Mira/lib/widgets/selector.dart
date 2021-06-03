import 'package:flutter/material.dart';

import '../main.dart';
import 'localization.dart';

void showSelectors(context) {
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
                        AppLocalizations.of(context).translate("selectorsandsort"),
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
                      value: selectorHelicopters,
                      onChanged: (value) {
                        setState(() {
                          selectorHelicopters = value;
                        });
                      },
                      title: Text("Helicopters"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      value: selectorRovers,
                      onChanged: (value) {
                        setState(() {
                          selectorRovers = value;
                        });
                      },
                      title: Text("Rovers"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      value: selectorOrbiters,
                      onChanged: (value) {
                        setState(() {
                          selectorOrbiters = value;
                        });
                      },
                      title: Text("Orbiters"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      value: selectorLanders,
                      onChanged: (value) {
                        setState(() {
                          selectorLanders = value;
                        });
                      },
                      title: Text("Landers"),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      value: selectorFlybys,
                      onChanged: (value) {
                        setState(() {
                          selectorFlybys = value;
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
                      value: sortIsReverse,
                      onChanged: (value) {
                        setState(() {
                          sortIsReverse = true;
                        });
                      },
                      title: Text(AppLocalizations.of(context).translate("ascending"),),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    CheckboxListTile(
                      value: !sortIsReverse,
                      onChanged: (value) {
                        setState(() {
                          sortIsReverse = false;
                        });
                      },
                      title: Text(AppLocalizations.of(context).translate("descending"),),
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
              onTap: (){Navigator.pop(context);},
              child: Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * .025,
                ),
                child: Text(
                  AppLocalizations.of(context).translate("back"),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .05,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  selectorFinalHelicopters.value = selectorHelicopters;
                  selectorFinalRovers.value = selectorRovers;
                  selectorFinalOrbiters.value = selectorOrbiters;
                  selectorFinalLanders.value = selectorLanders;
                  selectorFinalFlybys.value = selectorFlybys;

                  sortFinalIsReverse.value = sortIsReverse;

                });
                Navigator.pop(context);
              },
              child: Text(
                "Search",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * .05,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    ),
  );
}