// Flutter
import "package:flutter/material.dart";
import "package:splashscreen/splashscreen.dart";

// utils
import "../utils/localization.dart";
import "../pass.dart";

/// Splash screen of the app.
class SplashScreenPage extends StatelessWidget {
  /// Constructor
  const SplashScreenPage({required this.child, Key? key,}) : super(key: key);

  /// The widget that will displayed after the splashscreen.
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SplashScreen(
        seconds: 2,
        title: const Text(
          appTitle,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        loadingText: Text(
          AppLocalizations.of(context).translate("loading"),
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        loadingTextPadding: EdgeInsets.zero,
        imageBackground: const AssetImage(appBackground),
        backgroundColor: const Color(0xFFD66F3D),
        image: const Image(
          image: AssetImage(appLogo),
        ),
        photoSize: 50,
        useLoader: true,
        loaderColor: Colors.white,
        styleTextUnderTheLoader: const TextStyle(),
        navigateAfterSeconds: child,
      ),
    );
}
