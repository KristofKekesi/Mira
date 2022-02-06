// Flutter
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

// MiraApp
import "package:ussrmira/main.dart";

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
