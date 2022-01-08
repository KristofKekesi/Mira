// Flutter
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

// MiraApp
import "package:nasamira/main.dart";

void main() {
  // MiraApp
  testWidgets("MiraApp", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MiraApp(
        child: Scaffold(
          body: Text("test"),
        ),
      ),
    );
  });
}
