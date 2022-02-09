// Flutter
import "package:flutter/services.dart";
import "package:spacejam/spacejam.dart";
import "package:flutter/material.dart";
import "package:splashscreen/splashscreen.dart";

// utils
import "../utils/localization.dart";
import "../pass.dart";

/// Splash screen of the app.
class SplashScreenPage extends StatefulWidget {
  /// Constructor
  const SplashScreenPage({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The widget that will displayed after the splashscreen.
  final Widget child;

  @override
  SplashScreenState createState() => SplashScreenState();
}

/// The stateful part of the widget.
class SplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SplashScreen(
          seconds: 2,
          title: Text(
            appTitle,
            style: SpaceJamTextStyles.headline(context, color: Colors.white),
          ),
          loadingText: Text(
            AppLocalizations.of(context).translate("loading"),
            style: SpaceJamTextStyles.bodyMedium(context,
                color: Colors.white, fontWeight: FontWeight.bold,),
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
          navigateAfterSeconds: widget.child,
        ),
      );
}
