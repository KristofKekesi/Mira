import 'dart:io';

import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  final String name;
  final String redirect;
  final String image;

  const Application({Key key, this.name, this.redirect, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .025),
      child: Tooltip(
        message: name,
        child: Image(
          image: NetworkImage(image),
          width: MediaQuery.of(context).size.width * .15,
          height: MediaQuery.of(context).size.width * .15,
        ),
      ),
    );
  }
}

// todo make promo extension
class PromoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore:missing_return
    Future<bool> _widgetOpacity() async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } catch (_) {
        return false;
      }
    }

    return FutureBuilder<bool>(
        future: _widgetOpacity(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return Container(
                //color: Color(0xffDCDCDC),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * .2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * .025,
                    ),
                    Application(
                      name: "Elements",
                      image:
                          "https://play-lh.googleusercontent.com/uLZHtNEMYGNJrNiQ5vku85fX2dLS85Qnfhl3jEKluN5m5vLxR-1G4r6gQoC9W5gP-0g=s180-rw",
                    ),
                    Application(
                      name: "Preacher",
                      image:
                          "https://play-lh.googleusercontent.com/v-HoxSuPTB4XxQ_1Z8UGJV3eUjUqJ7D9bnNol8FaO-zZQ1jm04vBVxF_Ns5HDA7kg7E=s180-rw",
                    ),
                    Application(
                      name: "Clean Earth",
                      image:
                      "https://play-lh.googleusercontent.com/FC2hG2B5SSCWhmSmzBUIZ05wzwIS12gjX3IIfojIKGBxpGQBoRdG8NzyETWTCSok6Vf4=s180-rw",
                    ),
                    // Application(
                    //   name: "NASA Mira",
                    //   redirect:
                    //   "https://play.google.com/store/apps/details?id=com.kristofkekesi.nasamira",
                    //   image:
                    //   "https://play-lh.googleusercontent.com/5fosGp6zjFsa8pyy44UwosS8mEDdCG2e77wyqiQmyugReagRIxIzgH5alkDAwsWI7tM=s180-rw",
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width * .025,
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }
}
