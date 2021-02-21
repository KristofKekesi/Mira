import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../localization.dart';

_fetchAPI(url) async {
  Dio dio = new Dio();
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 30000;
  Response response = await dio.get(url);

  return response;
}

// ignore: non_constant_identifier_names
FutureBuilder _Data(url) {
  return FutureBuilder(
    future: _fetchAPI(url),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List data = snapshot.data.data["photos"];
        if (data.length == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).translate('imgNoRes'),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .1),
                    ),
                    Text(
                      AppLocalizations.of(context).translate('imgNoResCon'),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .05),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
              },child:ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {

              if (index == 0) {
                return Container(height: MediaQuery
                    .of(context)
                    .size
                    .height * .05);
              }

              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery
                        .of(context)
                        .size
                        .height * .05,
                    left: MediaQuery
                        .of(context)
                        .size
                        .width * .05,
                    right: MediaQuery
                        .of(context)
                        .size
                        .width * .05),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .8,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                              image: NetworkImage(data[index]["img_src"]),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            )),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .4,
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          image: DecorationImage(
                              image: AssetImage('lib/images/background.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery
                                .of(context)
                                .size
                                .height * .02,
                            bottom: MediaQuery
                                .of(context)
                                .size
                                .height * .02,
                            left: MediaQuery
                                .of(context)
                                .size
                                .width * .05,
                            right: MediaQuery
                                .of(context)
                                .size
                                .width * .05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                data[index]["rover"]["name"] +
                                    ' - ' +
                                    data[index]["id"].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * .05,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          titlePadding: EdgeInsets.all( MediaQuery.of(context).size.height * .05),
                                          contentPadding: EdgeInsets.only(bottom:  MediaQuery.of(context).size.height * .05, left:  MediaQuery.of(context).size.height * .05, right: MediaQuery.of(context).size.height * .05),
                                          title: Text('${data[index]["rover"]["name"]}', style: TextStyle(
                                              fontSize: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width * .05),),
                                          content: Container(
                                            width: MediaQuery.of(context).size.width * .6,
                                            child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(AppLocalizations.of(context).translate('popId'), style: TextStyle(
                                                      fontSize: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width * .05),),
                                                  Text(
                                                    data[index]["id"].toString(),
                                                    style: TextStyle(
                                                        fontSize: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width * .05),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(AppLocalizations.of(context).translate('popCamera'),
                                                    style: TextStyle(
                                                        fontSize: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width * .05),),
                                                  Tooltip(
                                                    message: data[index]["camera"]["name"],
                                                    child: Text(data[index]["camera"]["name"],
                                                      style: TextStyle(
                                                          fontSize: MediaQuery
                                                              .of(context)
                                                              .size
                                                              .width * .05),),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    AppLocalizations.of(context).translate('popDate'),
                                                    style: TextStyle(
                                                        fontSize:
                                                        MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width *
                                                            .05),
                                                  ),
                                                  Text(
                                                    data[index]["earth_date"],
                                                    style: TextStyle(
                                                        fontSize:
                                                        MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width *
                                                            .05),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    AppLocalizations.of(context).translate('popSol'),
                                                    style: TextStyle(
                                                        fontSize:
                                                        MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width *
                                                            .05),
                                                  ),
                                                  Text(
                                                    data[index]["sol"].toString(),
                                                    style: TextStyle(
                                                        fontSize:
                                                        MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width *
                                                            .05),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        ),
                                  );
                                },
                                child: Tooltip(message: AppLocalizations.of(context).translate("more"), child: Image(image: AssetImage('lib/images/more.png'),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .07,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width * .07,),
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          );
        }
      } else if (snapshot.hasError) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate('imgError'),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .1),
                  ),
                  Text(
                    "${snapshot.error}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .05),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05),
              child: Text(
                AppLocalizations.of(context).translate('loading'),
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )),
        ],
      );
    },
  );
}

// ignore: camel_case_types
class searchWindow extends StatefulWidget {
  final String url;
  final String date;

  const searchWindow({Key key, this.url, this.date})
      : super(key: key);

  @override
  _searchWindowState createState() => _searchWindowState();
}

// ignore: camel_case_types
class _searchWindowState extends State<searchWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //toolbarHeight: MediaQuery.of(context).size.height * .07,
        leading: Tooltip(
          message: AppLocalizations.of(context).translate('back'),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * .06,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: new Text(
          widget.date,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .07,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2.0),
        ),
      ),
      floatingActionButton: Container(
    height: MediaQuery.of(context).size.width * .12,
    width: MediaQuery.of(context).size.width * .12,
    child: FittedBox(child: Tooltip(
        message: AppLocalizations.of(context).translate('tooltipHome'),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.clear_thick, color: Colors.deepOrange),
        ),
      ),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _Data(widget.url),
        ),
      ),
    );
  }
}
