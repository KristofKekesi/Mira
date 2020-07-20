import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../models/model.dart';
import '../controllers/network_helper.dart';
import '../localization.dart';

FutureBuilder _Data(url) {
  return FutureBuilder<List<Data>>(
    future: GetData().getData(url),
    builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
      if (snapshot.hasData) {
        List<Data> data = snapshot.data;
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
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {

              if (index == 0) {
                //index--;
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
                              image: NetworkImage(data[index].src),
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
                                data[index].name +
                                    ' - ' +
                                    data[index].id.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * .07,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) =>
                                        AlertDialog(
                                          title: Text('${data[index].name}'),
                                          content: Column(
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
                                                    data[index].id.toString(),
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
                                                    message: data[index].camera,
                                                    child: Text(data[index].cam,
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
                                                    data[index].date,
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
                                                    data[index].sol.toString(),
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
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height *
                                                        .02),
                                                child: GestureDetector(
                                                  onTap: (){
                                                    print(data[index].src);
                                                    GallerySaver.saveImage(data[index].src);
                                                    },
                                                  child: Text(
                                                    AppLocalizations.of(context).translate('imgDown'),
                                                    style: TextStyle(
                                                        fontSize:
                                                        MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width *
                                                            .06,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                  );
                                },
                                child: Text('lol'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

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
        leading: Tooltip(
          message: AppLocalizations.of(context).translate('back'),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
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
      floatingActionButton: Tooltip(
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
