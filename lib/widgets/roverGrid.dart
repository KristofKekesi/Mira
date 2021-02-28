import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:nasamira/pages/roverSpecPage.dart';

double getGrid(context) {
  return MediaQuery.of(context).size.width * .4 -
      MediaQuery.of(context).size.width * .0125;
}

class RoverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('lib/data.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            final roverList = <Widget>[];
            for (var index = 0; index < data.length; index++) {
              roverList.add(
                GestureDetector(
                  onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RoverSpecPage(
                                apiEnabled: data[index]["api-enabled"],
                                url: data[index]["url"],
                                mission: data[index]["mission"],
                                nick: data[index]["nick"],
                                type: data[index]["type"],
                                launch: data[index]["launch"],
                                arrive: data[index]["arrive"],
                                connectionLost: data[index]["connection-lost"],
                                end: data[index]["end"],
                                defaultPosition: data[index]["default"],
                                operator: data[index]["operator"],
                                manufacturer: data[index]["manufacturer"],
                              )),
                    );},
                  child:
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .0125),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular((MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04),
                      ),
                    ),
                    width: getGrid(context),
                    height: MediaQuery.of(context).size.height * .2,
                    child: Padding(
                      padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              2 *
                              .03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Conditional.single(
                                context: context,
                                conditionBuilder: (BuildContext context) =>
                                    data[index]["mission"] == null,
                                widgetBuilder: (BuildContext context) =>
                                    Container(),
                                fallbackBuilder: (BuildContext context) => Text(
                                  data[index]["mission"],
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        (MediaQuery.of(context).size.height *
                                            .02),
                                  ),
                                ),
                              ),
                              Text(
                                data[index]["nick"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      (MediaQuery.of(context).size.height *
                                          .025),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "State",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          (MediaQuery.of(context).size.height *
                                              .02),
                                    ),
                                  ),
                                  Conditional.single(
                                    context: context,
                                    conditionBuilder: (BuildContext context) =>
                                        data[index]["connection-lost"] == null,
                                    widgetBuilder: (BuildContext context) =>
                                        Text(
                                          "Active",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            (MediaQuery.of(context).size.height *
                                                .025),
                                          ),
                                        ),
                                    fallbackBuilder: (BuildContext context) =>
                                        Text(
                                      "Inactive",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                        (MediaQuery.of(context).size.height *
                                            .025),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: MediaQuery.of(context).size.width * .1,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),),
              );
            }
            return Container(
              width: MediaQuery.of(context).size.width * .825,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 0,
                runSpacing: 0,
                children: roverList,
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
