// Flutter
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

// utils
import '../utils/localization.dart';

class SplashScreenPage extends StatelessWidget {
  final Widget child;

  const SplashScreenPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 2,
        title: const Text(
          'ESA Mira',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        loadingText: Text(
          AppLocalizations.of(context).translate('loading'),
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        loadingTextPadding: EdgeInsets.zero,
        imageBackground: const AssetImage('lib/images/esa-background.jpg'),
        backgroundColor: const Color(0xFFD66F3D),
        image: const Image(
          image: AssetImage('lib/images/esa-logo.png'),
        ),
        photoSize: 50,
        useLoader: true,
        loaderColor: Colors.white,
        styleTextUnderTheLoader: const TextStyle(),
        navigateAfterSeconds: child,
      ),
    );
  }
}
