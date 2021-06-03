import 'package:flutter/material.dart';
import 'package:nasamira/widgets/appbars.dart';
import 'package:nasamira/widgets/localization.dart';

class VehicleSearch extends StatelessWidget {
  final mission;
  final type;

  const VehicleSearch({Key key, this.mission, this.type}) : super(key: key);

  Widget searchContent() {
    if (mission != null) {
      return Text("Types");
    } else if (type != null) {
      return Text("Missions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05),
                    child: Opacity(
                      opacity: 0,
                      child: Appbar(
                        // TODO localize
                        title: "Search for",
                        subtitle: "Orbiters",
                        leftAction: Container(),
                        rightAction: Tooltip(
                          message: AppLocalizations.of(context)
                              .translate("settings"),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.menu,
                              size: MediaQuery.of(context).size.width * .075,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  searchContent(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05),
              child: Appbar(
                // TODO localize
                title: "Search for",
                subtitle: "Orbiters",
                leftAction: Container(),
                rightAction: Tooltip(
                  message: AppLocalizations.of(context).translate("settings"),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.menu,
                      size: MediaQuery.of(context).size.width * .075,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
