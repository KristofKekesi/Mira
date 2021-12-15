// @dart=2.9

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../utils/localization.dart';


class SplashScreenPage extends StatelessWidget {
  final Widget child;

  const SplashScreenPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 2,
        title: Text(
          'NASA Mira',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        loadingText: Text(
          AppLocalizations.of(context).translate('loading'),
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        loadingTextPadding: EdgeInsets.zero,
        imageBackground: AssetImage('lib/images/background.jpg'),
        backgroundColor: Color(0xFFD66F3D),
        image: Image(
          image: AssetImage('lib/images/mira_logo.png'),
        ),
        photoSize: 50,
        useLoader: true,
        loaderColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        navigateAfterSeconds: child,
      ),
    );
  }
}
