import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:mira/pages/curiosity.dart';

// ignore: camel_case_types
class isnotavailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 1,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  topRight: const Radius.circular(25),
                )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.not_interested,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                  Text(
                    'This feature\nisn\' t\navailable!',
                    style: TextStyle(
                        color: Color(0xffe66909),
                        decoration: TextDecoration.none,
                        fontSize: 15,
                        letterSpacing: 3),
                  )
                ])));
  }
}

class credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        builder: (context, scrollController) {
          return SingleChildScrollView(
              child: Text('Kekesi Kristof: Programming')
          );
        }
    );
  }
}