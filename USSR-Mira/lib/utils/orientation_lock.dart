import "package:flutter/services.dart";

/// Locks the orientation of the app.
/// Also recommend to check the orientation at
/// Runner.xcodeproj > Deployment info > Device Orientation
void orientationLock() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
