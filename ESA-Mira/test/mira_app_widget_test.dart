// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

// MiraApp
import "package:esamira/main.dart";

void main() {
  // MiraApp
  testWidgets("MiraApp", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MiraApp(
        home: Scaffold(
          body: Text("test"),
        ),
      ),
    );
  });
}
