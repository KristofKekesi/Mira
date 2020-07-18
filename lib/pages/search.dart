import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';
import '../controllers/network_helper.dart';
import '../localization.dart';

FutureBuilder _Data() {
  return FutureBuilder<List<Data>>(
    future: GetData().getData(),
    builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
      if (snapshot.hasData) {
        List<Data> data = snapshot.data;
        return ListView.builder(
            itemCount: data.length,
            //scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.black, image: DecorationImage(image: NetworkImage(data[index].src),), borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16),)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .4,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16),),
//                          gradient: LinearGradient(
//                            colors: [
//                              Colors.deepOrangeAccent,
//                              Colors.deepOrange,
//                            ],
//                            begin: Alignment.topLeft,
//                            end: Alignment.bottomRight),
                           image: DecorationImage(image: AssetImage('lib/images/background.jpg'), fit: BoxFit.cover),
                            ),
                        child: Column(
                          children: <Widget>[
                      Text(data[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width * .07,
                            color: Colors.white,
                          )),
                      Text(data[index].id.toString(), style: TextStyle(fontSize: MediaQuery.of(context).size.width * .07,
                        color: Colors.white,),),
                            ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

// ignore: camel_case_types
class searchWindow extends StatefulWidget {
  final String url;
  final String model;
  final String date;

  const searchWindow({Key key, this.url, this.model, this.date})
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
          widget.model,
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
        child: Column(
          children: <Widget>[
            Text(widget.date),
            Container(
              height: MediaQuery.of(context).size.height * .8,
              width: MediaQuery.of(context).size.width * .9,
              child: _Data(),
            ),
          ],
        ),
      ),
    );
  }
}
